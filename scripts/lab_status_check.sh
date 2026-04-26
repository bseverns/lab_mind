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

check "cockpit" "http://r900.lab.internal"
check "docs" "http://r900.lab.internal/docs"
check "portainer" "https://r900.lab.internal:9443"
check "nodered" "http://r900.lab.internal:1880"
check "openwebui" "http://jetson-a.lab.internal:3000"

MODEL_SERVER_URL="${MODEL_SERVER_URL:-${OLLAMA_URL:-}}"

if [[ -n "$MODEL_SERVER_URL" ]]; then
  if curl -fsS --max-time 5 "$MODEL_SERVER_URL/api/tags" >/dev/null 2>&1 || \
     curl -fsS --max-time 5 "$MODEL_SERVER_URL/v1/models" >/dev/null 2>&1; then
    echo "GREEN local model api $MODEL_SERVER_URL"
  else
    echo "YELLOW local model api not reachable; check Jetson-A model stack"
  fi
else
  echo "YELLOW local model api not checked; set MODEL_SERVER_URL to a private backend URL"
fi
