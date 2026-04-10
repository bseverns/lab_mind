# Ben Fast Path

## Summary
This is the compressed rebuild/bring-up sequence for when you already know the room and just need the shortest sane route.

## Fast path
1. boot flashed card
2. set hostname
3. verify NVMe
4. run `ops/jetson/scripts/install_base.sh`
5. run `ops/jetson/scripts/move_docker_to_nvme.sh`
6. copy `ops/jetson/.env.example` to `ops/jetson/.env`
7. edit known values only
8. `cd ops/jetson && docker compose up -d`
9. verify Portainer / Open WebUI / Node-RED / Syncthing
10. enroll in Headscale-managed access once values are real
11. verify Digital Factory separately
12. enable CNCjs only if Cubiko is physically attached

## Checks
```bash
hostname
lsblk
df -h
docker ps
docker compose -f ops/jetson/docker-compose.yml ps
bash ops/jetson/scripts/check_lab_brain.sh
```
