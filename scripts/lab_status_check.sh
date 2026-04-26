#!/usr/bin/env bash
set -euo pipefail

check() {
  local name="$1"
  local url="$2"
  if curl -fsS --max-time 5 "$url" >/dev/null 2>&1; then
    echo "GREEN $name $url"
  else
    echo "RED $name $url"
  fi
}

check "cockpit" "http://r900.local"
check "docs" "http://r900.local/docs"
check "portainer" "https://r900.local:9443"
check "nodered" "http://r900.local:1880"
check "openwebui" "http://jetson-a.local:3000"

MODEL_SERVER_URL="${MODEL_SERVER_URL:-${OLLAMA_URL:-http://127.0.0.1:8081}}"

if curl -fsS --max-time 5 "$MODEL_SERVER_URL/api/tags" >/dev/null 2>&1 || \
   curl -fsS --max-time 5 "$MODEL_SERVER_URL/v1/models" >/dev/null 2>&1; then
  echo "GREEN local model api $MODEL_SERVER_URL"
else
  echo "YELLOW local model api not reachable; check Jetson-A model stack"
fi
