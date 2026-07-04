#!/usr/bin/env bash
# Symlink every skill in this repo into ~/.claude/skills/ so Claude Code
# discovers them. Safe to re-run: existing links are replaced, not nested.
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dest="$HOME/.claude/skills"
mkdir -p "$dest"

for d in "$repo"/*/; do
  name="$(basename "$d")"
  ln -sfn "${d%/}" "$dest/$name"
  echo "linked $name -> $dest/$name"
done
