# VPS Setup: Headscale Coordination Node

This document outlines the requirements and bootstrap steps for the external Ubuntu VPS used as the control plane for the ClassHub Homework Helper stack.

## Host Requirements
- **OS**: Ubuntu 22.04 or 24.04 LTS
- **Specs**: 1 vCPU, 1 GB RAM (Tiny VPS class)
- **Networking**: Stable Public IP, Ports 80/443 (HTTP/S) and 8080 (Headscale default) open.

## Bootstrap Sequence

```bash
# 1. Clone/Sync Headscale Ops from ClassHub
# (On the VPS)
git clone https://github.com/bseverns/selfhosted-classhub /srv/headscale/app

# 2. Run Bootstrap Script
cd /srv/headscale/app
sudo bash ops/headscale/install.sh

# 3. Configure Values
# Copy examples and edit with your stable domain (e.g., hs.yourdomain.com)
sudo cp /srv/headscale/config/config.yaml.example /srv/headscale/config/config.yaml

# 4. Start Services
sudo systemctl enable --now classhub-headscale
sudo systemctl enable --now classhub-headscale-backup.timer
```

## Lab Integration
- Use **Jetson-A** as a subnet router to bridge local lab resources.
- Enroll the **ThunderCompute** vGPU and the **LMS Server** using the `headscale nodes register` command.
