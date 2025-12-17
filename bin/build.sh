#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

# --- precheck ---
command -v pandoc >/dev/null 2>&1 || {
  echo "pandoc not found. Install it first:"
  echo "  brew install pandoc"
  exit 1
}

[ -f "template.html" ] || { echo "template.html not found"; exit 1; }
[ -f "index.md" ] || { echo "index.md not found"; exit 1; }
[ -f "en/index.md" ] || { echo "en/index.md not found"; exit 1; }

mkdir -p en

# --- build ---
echo "Building index.html (ja)..."
pandoc index.md \
  --from=gfm \
  --to=html \
  --standalone \
  --template=template.html \
  --metadata title="Human Attunement System (HAS)" \
  --output=index.html

echo "Building en/index.html (en)..."
pandoc en/index.md \
  --from=gfm \
  --to=html \
  --standalone \
  --template=template.html \
  --metadata title="Human Attunement System (HAS)" \
  --output=en/index.html

# Stop Jekyll (keep pages raw)
touch .nojekyll

echo
echo "Done."
echo "Generated:"
echo "  ./index.html"
echo "  ./en/index.html"
echo "  ./.nojekyll"