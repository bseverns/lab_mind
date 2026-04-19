#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="${1:-/srv/labbrain/known-good}"
STAMP="$(date -u +%Y%m%dT%H%M%SZ)"
OUT="$OUT_DIR/known_good_$STAMP.md"
mkdir -p "$OUT_DIR"

{
  echo "# Known Good State — $STAMP"
  echo
  echo "## Host"
  hostname || true
  echo
  echo "## Kernel"
  uname -a || true
  echo
  echo "## Storage"
  lsblk || true
  df -h || true
  echo
  echo "## Docker"
  docker --version || true
  docker compose version || true
  docker ps || true
  echo
  echo "## Ollama models"
  curl -fsS http://127.0.0.1:11434/api/tags || true
  echo
  echo "## Notes"
  echo "Add human notes here. Do not paste secrets."
} > "$OUT"

echo "Wrote $OUT"
