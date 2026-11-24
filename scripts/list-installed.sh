#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
codex_home="${CODEX_HOME:-${HOME}/.codex}"
shared_dir="${AGENTS_SKILLS_DIR:-${HOME}/.agents/skills}"
legacy_dir="${codex_home}/skills"
cache_dir="${codex_home}/upstream-skills"
manifest="${repo_root}/config/global-skill-upstreams.tsv"

declare -A managed=() repositories=() pins=() source_paths=()

while IFS=$'\t' read -r name repository pin source_path extra || [[ -n "${name:-}" ]]; do
  [[ -z "${name}" || "${name}" == \#* ]] && continue
  managed["${name}"]=upstream
  repositories["${name}"]="${repository}"
  pins["${name}"]="${pin}"
  source_paths["${name}"]="${source_path}"
done < "${manifest}"

shopt -s nullglob dotglob
for source in "${repo_root}"/global/*; do
  [[ -d "${source}" && ! -L "${source}" ]] || continue
  name="${source##*/}"
  managed["${name}"]=local
done

entry_status() {
  local entry="$1" expected="$2" actual_target expected_target
  if [[ -L "${entry}" ]]; then
    if [[ ! -e "${entry}" ]]; then
      printf 'broken symlink'
    elif actual_target="$(realpath -e -- "${entry}" 2>/dev/null)" &&
         expected_target="$(realpath -e -- "${expected}" 2>/dev/null)" &&
         [[ "${actual_target}" == "${expected_target}" ]]; then
      printf 'linked'
    else
      printf 'unexpected origin'
    fi
  elif [[ -e "${entry}" ]]; then
    printf 'unexpected origin'
  else
    printf 'missing'
  fi
}

checkout_status() {
  local checkout="$1" repository="$2" pin="$3" origin head
  if [[ ! -d "${checkout}" || ! -e "${checkout}/.git" ]]; then
    printf 'missing or invalid'
    return
  fi
  if ! origin="$(GIT_OPTIONAL_LOCKS=0 git -C "${checkout}" config --get remote.origin.url 2>/dev/null)"; then
    printf 'origin unavailable'
  elif [[ "${origin}" != "${repository}" ]]; then
    printf 'unexpected origin'
  else
    printf 'origin OK'
  fi
  if ! head="$(GIT_OPTIONAL_LOCKS=0 git -C "${checkout}" rev-parse --verify 'HEAD^{commit}' 2>/dev/null)"; then
    printf ', pin unavailable'
  elif [[ "${head}" != "${pin}" ]]; then
    printf ', pin mismatch'
  else
    printf ', pin OK'
  fi
}

same_directory=0
if [[ -d "${shared_dir}" && -d "${legacy_dir}" && "${shared_dir}" -ef "${legacy_dir}" ]]; then
  same_directory=1
fi

printf 'Managed skills:\n'
while IFS= read -r name; do
  [[ -n "${name}" ]] || continue
  if [[ "${managed[${name}]}" == local ]]; then
    expected="${repo_root}/global/${name}"
  else
    expected="${cache_dir}/${name}/${source_paths[${name}]}"
  fi
  shared="${shared_dir}/${name}"
  legacy="${legacy_dir}/${name}"
  printf '%s: shared=%s' "${name}" "$(entry_status "${shared}" "${expected}")"
  if [[ "${same_directory}" -eq 0 ]]; then
    printf '; legacy=%s' "$(entry_status "${legacy}" "${expected}")"
    if [[ ( -e "${shared}" || -L "${shared}" ) && ( -e "${legacy}" || -L "${legacy}" ) ]]; then
      printf '; duplicate'
    fi
  else
    printf '; legacy=same directory'
  fi
  if [[ -n "${repositories[${name}]+set}" ]]; then
    printf '; checkout=%s' "$(checkout_status "${cache_dir}/${name}" "${repositories[${name}]}" "${pins[${name}]}")"
  fi
  printf '\n'
done < <(printf '%s\n' "${!managed[@]}" | LC_ALL=C sort)

list_foreign() {
  local label="$1" directory="$2" entry name status
  for entry in "${directory}"/*; do
    name="${entry##*/}"
    [[ -n "${managed[${name}]+set}" ]] && continue
    status=foreign
    if [[ -L "${entry}" && ! -e "${entry}" ]]; then
      status='foreign, broken symlink'
    fi
    printf '%s: %s (%s)' "${label}" "${name}" "${status}"
    if [[ "${same_directory}" -eq 0 && "${label}" == shared ]] &&
       [[ -e "${legacy_dir}/${name}" || -L "${legacy_dir}/${name}" ]]; then
      printf ' (duplicate in legacy)'
    fi
    printf '\n'
  done
}

printf '\nOther entries:\n'
list_foreign shared "${shared_dir}"
if [[ "${same_directory}" -eq 0 ]]; then
  list_foreign legacy "${legacy_dir}"
fi
