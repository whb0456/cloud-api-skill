#!/usr/bin/env sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
skill_dir=${CODEX_SKILL_DIR:-"${HOME}/.agents/skills/dji-cloud-api"}

if [ ! -f "$script_dir/SKILL.md" ]; then
  echo "SKILL.md was not found in $script_dir" >&2
  exit 1
fi
if [ ! -f "$script_dir/references/INDEX.md" ]; then
  echo "references/INDEX.md was not found in $script_dir" >&2
  exit 1
fi

mkdir -p "$skill_dir"
cp "$script_dir/SKILL.md" "$skill_dir/SKILL.md"
mkdir -p "$skill_dir/references"
cp -R "$script_dir/references/." "$skill_dir/references/"

printf 'Installed dji-cloud-api skill to %s\n' "$skill_dir"
