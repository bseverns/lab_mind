#!/usr/bin/env bash
set -euo pipefail

URL="${MODEL_SERVER_URL:-${OLLAMA_URL:-http://127.0.0.1:8081}}"

probe() {
  local path="$1"
  if curl -fsS "$URL$path" | python3 -m json.tool; then
    return 0
  fi
  return 1
}

echo "Checking local model server at $URL"

if probe "/api/tags"; then
  exit 0
fi

if probe "/v1/models"; then
  exit 0
fi

echo "Unable to read Ollama-style or OpenAI-compatible model listings"
exit 1
