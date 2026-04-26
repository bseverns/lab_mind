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
  echo "## Local model server"
  MODEL_SERVER_URL="${MODEL_SERVER_URL:-${OLLAMA_URL:-}}"
  if [[ -n "$MODEL_SERVER_URL" ]]; then
    if curl -fsS "$MODEL_SERVER_URL/api/tags" >/dev/null 2>&1; then
      curl -fsS "$MODEL_SERVER_URL/api/tags" || true
    else
      curl -fsS "$MODEL_SERVER_URL/v1/models" || true
    fi
  else
    echo "MODEL_SERVER_URL not set; skipping model probe"
  fi
  echo
  echo "## Notes"
  echo "Add human notes here. Do not paste secrets."
} > "$OUT"

echo "Wrote $OUT"
