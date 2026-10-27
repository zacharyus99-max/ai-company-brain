#!/usr/bin/env bash
# Safe two-way sync: pull --rebase --autostash → add → commit → push
# Never force-pushes.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

echo "[sync] repo: $ROOT"

git pull --rebase --autostash origin HEAD || git pull --rebase --autostash

if git diff --quiet && git diff --cached --quiet; then
  # still check untracked
  if [ -z "$(git status --porcelain)" ]; then
    echo "[sync] nothing to commit"
    git push
    echo "[sync] done"
    exit 0
  fi
fi

git add -A
MSG="chore(sync): vault sync $(date +%Y-%m-%dT%H:%M:%S%z)"
git commit -m "$MSG" || echo "[sync] commit skipped (nothing new?)"
git push
echo "[sync] done"
