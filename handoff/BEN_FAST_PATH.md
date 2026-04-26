# Ben Fast Path

## What lives where

- R900: backups, shared storage, monitoring, dashboards, Portainer, docs mirror, known-good archive
- Jetson-A: Open WebUI, model serving, code help, local docs/RAG
- Jetson-B/C: room status, service polling, local dashboards, machine-adjacent helpers
- Pis: kiosks, bridges, signage, sensors

## First useful shell pass

```bash
hostname
lsblk
df -h
docker ps
curl -fsS http://127.0.0.1:8081/api/tags || true
curl -fsS http://127.0.0.1:8081/v1/models || true
```

## Rebuild order

1. R900 boot, storage, and archive
2. Jetson-A boot, NVMe, and Docker
3. assistant UI and model
4. cockpit page
5. Jetson-B and Jetson-C edge roles
6. Headscale remote access
7. Digital Factory check and printer inventory
8. CNCjs only if physical placement makes sense

## Do not spend time on

- distributed inference across old Nanos
- making all nodes symmetrical
- public dashboards
- perfect automation before the first working cockpit
