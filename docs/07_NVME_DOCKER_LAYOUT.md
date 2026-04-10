# NVMe Docker Layout

## Goal
Keep service state off the microSD card.

## Recommended layout

- `/srv/docker` = Docker data root
- `/srv/jetson/openwebui`
- `/srv/jetson/ollama`
- `/srv/jetson/portainer`
- `/srv/jetson/nodered`
- `/srv/jetson/syncthing`
- `/srv/jetson/cncjs`
- `/srv/jetson/backups`

## Why
MicroSD is the easy rebuild medium.
NVMe is the durable service medium.

## Check commands

```bash
docker info | grep "Docker Root Dir"
lsblk
df -h
```

## Rule
Do not start pulling large images until Docker is confirmed to be using the NVMe-backed data root.
