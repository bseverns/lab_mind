#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-/srv/docker}"

echo "[lab-brain] moving Docker data-root to ${TARGET}"
sudo mkdir -p "${TARGET}"
sudo systemctl stop docker

if [[ -d /var/lib/docker ]] && [[ ! -L /var/lib/docker ]]; then
  sudo rsync -aP /var/lib/docker/ "${TARGET}/"
fi

sudo mkdir -p /etc/docker
cat <<EOF | sudo tee /etc/docker/daemon.json >/dev/null
{
  "data-root": "${TARGET}",
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
EOF

sudo systemctl daemon-reload
sudo systemctl start docker
docker info | grep "Docker Root Dir" || true
