#!/usr/bin/env bash
set -euo pipefail

# Usage: bin/fm-local-env.sh <source_repo_dir> <worktree_dir> [slot_number]
SRC_REPO="${1:?Usage: fm-local-env.sh <source_repo> <worktree_dir> [slot]}"
WORKTREE_DIR="${2:?Usage: fm-local-env.sh <source_repo> <worktree_dir> [slot]}"
SLOT="${3:-1}"

# Symlink common git-ignored config/secret files if present in source repo
for file in .env .env.local .env.development.local .npmrc; do
  if [ -f "$SRC_REPO/$file" ] && [ ! -e "$WORKTREE_DIR/$file" ]; then
    ln -s "$SRC_REPO/$file" "$WORKTREE_DIR/$file"
    echo "Linked $file -> $WORKTREE_DIR/$file"
  fi
done

# Assign isolated localhost port offsets so parallel crewmates never collide
BASE_PORT=$((3000 + SLOT * 10))
cat << PORTEOF > "$WORKTREE_DIR/.env.worktree"
PORT=$BASE_PORT
API_PORT=$((BASE_PORT + 1))
VITE_PORT=$((BASE_PORT + 2))
PORTEOF

echo "Assigned isolated ports starting at $BASE_PORT in $WORKTREE_DIR/.env.worktree"
