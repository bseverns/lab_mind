#!/usr/bin/env bash
set -euo pipefail

echo "[lab-brain] updating apt metadata"
sudo apt-get update -y

echo "[lab-brain] installing base packages"
sudo apt-get install -y   ca-certificates   curl   gnupg   lsb-release   git   jq   unzip   ufw   fail2ban

if ! command -v docker >/dev/null 2>&1; then
  echo "[lab-brain] installing Docker"
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg
  . /etc/os-release
  echo     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu ${VERSION_CODENAME} stable" |     sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
  sudo apt-get update -y
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
fi

sudo systemctl enable --now docker

echo "[lab-brain] done"
docker --version
docker compose version
