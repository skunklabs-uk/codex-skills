#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
config_file="${repo_root}/config/global-skill-prune.txt"
codex_home="${CODEX_HOME:-${HOME}/.codex}"
skills_dir="${codex_home}/skills"
dry_run=0

usage() {
  cat <<'EOF'
Usage: scripts/prune-local.sh [--dry-run]

Move listed global skill entries out of discovery into $CODEX_HOME/skill-backups.
Only direct children of $CODEX_HOME/skills are moved; symlink targets are untouched.
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

  target="${skills_dir}/${entry}"

  if [[ ! -e "${target}" && ! -L "${target}" ]]; then
    echo "SKIP ${entry}: not installed"
    skipped=$((skipped + 1))
    continue
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
done < "${config_file}"

if [[ "${dry_run}" -eq 1 ]]; then
  echo "Dry run complete: ${removed} removal(s), ${skipped} already absent."
else
  echo "Prune complete: ${removed} removed, ${skipped} already absent. Restart Codex to refresh the skill catalog."
fi
