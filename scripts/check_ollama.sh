#!/usr/bin/env bash
set -euo pipefail

URL="${MODEL_SERVER_URL:-${OLLAMA_URL:-}}"

if [[ -z "$URL" ]]; then
  echo "MODEL_SERVER_URL or OLLAMA_URL must point at a private backend URL"
  exit 1
fi

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
