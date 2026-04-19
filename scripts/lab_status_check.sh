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

check "cockpit" "http://labbrain-a.local"
check "openwebui" "http://labbrain-a.local:3000"
check "docs" "http://labbrain-c.local"
check "nodered" "http://labbrain-b.local:1880"

if curl -fsS --max-time 5 "http://labbrain-a.local:11434/api/tags" >/dev/null 2>&1; then
  echo "GREEN ollama local api"
else
  echo "YELLOW ollama local api not reachable through hostname; try on Jetson-A with 127.0.0.1"
fi
