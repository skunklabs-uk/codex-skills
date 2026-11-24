#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
config_file="${repo_root}/config/global-skill-prune.txt"
codex_home="${CODEX_HOME:-${HOME}/.codex}"
skills_dir="${codex_home}/skills"
shared_dir="${AGENTS_SKILLS_DIR:-${HOME}/.agents/skills}"
dry_run=0

usage() {
  cat <<'EOF'
Usage: scripts/prune-local.sh [--dry-run]

Move listed legacy entries and managed shared links out of discovery into
$CODEX_HOME/skill-backups. Symlink targets are untouched.
EOF
}

while [[ "${1:-}" == --* ]]; do
  case "$1" in
    --dry-run)
      dry_run=1
      shift
      ;;
    --help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ "$#" -ne 0 ]]; then
  usage >&2
  exit 2
fi

if [[ ! -f "${config_file}" ]]; then
  echo "Missing prune list: ${config_file}" >&2
  exit 1
fi

mkdir -p "${skills_dir}"

removed=0
skipped=0

while IFS= read -r raw_line || [[ -n "${raw_line}" ]]; do
  entry="${raw_line%%#*}"
  entry="${entry#"${entry%%[![:space:]]*}"}"
  entry="${entry%"${entry##*[![:space:]]}"}"

  [[ -z "${entry}" ]] && continue

  if [[ "${entry}" == */* || "${entry}" == "." || "${entry}" == ".." ]]; then
    echo "ERROR invalid prune entry: ${entry}" >&2
    exit 1
  fi

  found=0
  shared_removable=0
  for scope in shared legacy; do
    directory="${skills_dir}"
    if [[ "${scope}" == shared ]]; then
      directory="${shared_dir}"
    fi
    if [[ "${scope}" == legacy && "${shared_dir}" -ef "${skills_dir}" ]]; then
      continue
    fi
    target="${directory}/${entry}"
    if [[ ! -e "${target}" && ! -L "${target}" ]]; then
      continue
    fi
    if [[ "${scope}" == shared ]]; then
      # Shared entries are retired only when their target identifies our cache or repository.
      [[ -L "${target}" ]] || continue
      resolved="$(readlink -m "${target}")"
      cache_source="$(readlink -m "${codex_home}/upstream-skills/${entry}")"
      local_source="$(readlink -m "${repo_root}/global/${entry}")"
      case "${resolved}" in
        "${cache_source}"|"${cache_source}/"*|"${local_source}")
          ;;
        *) continue ;;
      esac
      shared_removable=1
    fi
    if [[ "${scope}" == legacy ]]; then
      for shared_entry in "${shared_dir}"/* "${shared_dir}"/.[!.]* "${shared_dir}"/..?*; do
        [[ -L "${shared_entry}" && "${shared_entry}" -ef "${target}" ]] || continue
        [[ "${shared_removable}" -eq 1 && "${shared_entry}" == "${shared_dir}/${entry}" ]] && continue
        echo "SKIP ${target}: referenced by a preserved shared link"
        continue 2
      done
    fi
    if [[ "${dry_run}" -eq 1 ]]; then
      echo "WOULD REMOVE ${target}"
    else
      mkdir -p "${codex_home}/skill-backups"
      backup_dir="$(mktemp -d "${codex_home}/skill-backups/${entry}.XXXXXX")/skill"
      mv -- "${target}" "${backup_dir}"
      echo "RETIRED ${target} -> ${backup_dir}"
    fi
    removed=$((removed + 1))
    found=1
  done
  [[ "${found}" -eq 1 ]] || skipped=$((skipped + 1))
done < "${config_file}"

if [[ "${dry_run}" -eq 1 ]]; then
  echo "Dry run complete: ${removed} removal(s), ${skipped} already absent."
else
  echo "Prune complete: ${removed} removed, ${skipped} already absent. Restart Codex to refresh the skill catalog."
fi
