#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

./bin/build.sh

# show diff summary
echo
git status --porcelain

if [ -z "$(git status --porcelain)" ]; then
  echo "No changes to commit."
  exit 0
fi

git add index.html en/index.html .nojekyll
git commit -m "build: update static HTML"
git push

echo "Published."