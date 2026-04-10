# Blank Card Rebuild

## Summary
This is the canonical rebuild path for a freshly flashed card.

## Step 1: boot
1. insert the flashed microSD card
2. power on Jetson-A
3. complete first-boot setup
4. connect to network
5. confirm browser access works

## Step 2: verify storage
Run:

```bash
lsblk
df -h
```

Confirm:
- microSD is present
- NVMe is present
- you know which device is the NVMe before touching mounts

## Step 3: set hostname
Example:

```bash
sudo hostnamectl set-hostname jetson-a
hostname
```

## Step 4: mount NVMe
Use one stable path. Recommended:

- `/srv`
- `/srv/docker`
- `/srv/jetson`

Create the spine:

```bash
sudo mkdir -p /srv/docker
sudo mkdir -p /srv/jetson/{openwebui,ollama,portainer,nodered,syncthing,cncjs,backups}
```

Record the final choice in `ops/jetson/HEADSCALE_VALUES.example` and `ops/jetson/templates/rebuild_log.md`.

## Step 5: install Docker and Compose
Use the base script:

```bash
bash ops/jetson/scripts/install_base.sh
```

Then verify:

```bash
docker --version
docker compose version
```

## Step 6: move Docker data root to NVMe
Use:

```bash
sudo bash ops/jetson/scripts/move_docker_to_nvme.sh
```

Then verify again.

## Step 7: deploy the stack
Copy the example env first:

```bash
cp ops/jetson/.env.example ops/jetson/.env
```

Edit the values you already know.
Leave unknown Headscale values blank or clearly marked.

Then start the containers:

```bash
cd ops/jetson
docker compose up -d
```

## Step 8: open the browser tools
Confirm you can reach:
- Portainer
- Open WebUI
- Node-RED
- Syncthing
- CNCjs only if enabled

## Step 9: private access
Use `11_HEADSCALE_JETSON_SIDE.md`.
Do not invent the final enrollment method.

## Step 10: Digital Factory check
Use `09_DIGITAL_FACTORY_SETUP.md`.
Confirm printer visibility separately from the Jetson services.

## Success signal
The rebuild is complete when:
- the box boots
- Docker runs
- services open in browser
- Digital Factory opens and shows the expected fleet
- no guessed Headscale values were used
