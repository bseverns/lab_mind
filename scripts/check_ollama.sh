#!/usr/bin/env bash
set -euo pipefail

URL="${OLLAMA_URL:-http://127.0.0.1:11434}"

echo "Checking Ollama at $URL"
curl -fsS "$URL/api/tags" | python3 -m json.tool
