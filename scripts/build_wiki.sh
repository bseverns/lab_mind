#!/usr/bin/env sh
set -eu

# Build the MkDocs wiki site into ./site.
# Use "mkdocs serve" separately if you want a live preview.

if command -v mkdocs >/dev/null 2>&1; then
  exec mkdocs build --strict
fi

if python3 -c 'import mkdocs' >/dev/null 2>&1; then
  exec python3 -m mkdocs build --strict
fi

echo "mkdocs is not installed. Install mkdocs and mkdocs-material, then rerun this script." >&2
exit 127
