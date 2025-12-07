#!/usr/bin/env bash

set -euo pipefail

LOGFILE="$HOME/.cache/chezmoi-sync.log"
CHEZDIR="$HOME/.local/share/chezmoi"

exec > >(tee -a "$LOGFILE") 2>&1

echo "=== $(date '+%F %T') START ==="

# ------------------------------------
# 1. upstream → local（左方向）
# ------------------------------------
echo "[1] chezmoi update (pull + apply)"
chezmoi update --verbose || {
    echo "!! chezmoi update failed"
    echo "=== END (FAILED) ==="
    exit 1
}

chezmoi cd

# commit only if something changed
echo "[2] git commit"
git add -A
if git diff --cached --quiet; then
    echo "  No local changes to commit."
else
    git commit -m "auto sync $(date '+%F %T')" || true
fi

# ------------------------------------
# 3. push (右方向)
# ------------------------------------
echo "[3] git push"
git push || {
    echo "!! git push failed"
    echo "=== END (FAILED) ==="
    exit 1
}

echo "=== END (OK) ==="
