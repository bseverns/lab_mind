#!/usr/bin/env bash
set -euo pipefail

echo "== host =="
hostname

echo
echo "== storage =="
lsblk
df -h

echo
echo "== docker =="
docker ps
docker info | grep "Docker Root Dir" || true

echo
echo "== compose =="
if [[ -f ops/jetson/docker-compose.yml ]]; then
  docker compose -f ops/jetson/docker-compose.yml ps
else
  echo "ops/jetson/docker-compose.yml not found"
fi
