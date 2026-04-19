# 17 — Deployment Phases

## Phase 0: Paper map

Before installing anything, fill:

- `templates/NODE_INVENTORY.csv`
- `templates/SERVICE_MATRIX.csv`
- `templates/HEADSCALE_VALUES.example`

## Phase 1: Jetson-A alone

Install:

- Docker
- Portainer
- Ollama/llama.cpp
- Open WebUI
- cockpit page
- Syncthing

Success:

- local assistant works
- cockpit opens
- NVMe is mounted
- model test log has first entries

## Phase 2: Jetson-C recovery node

Install:

- static docs server
- Syncthing
- known-good archive path

Success:

- docs open while Jetson-A is offline or being changed
- printed/intern docs are available from tablet

## Phase 3: Jetson-B sentinel

Install:

- Node-RED
- health check scripts
- optional MQTT

Success:

- status summary can identify A online/offline
- Digital Factory link/checklist is visible
- docs node is monitored

## Phase 4: Headscale remote path

Do only after values are real.

Success:

- educator laptop reaches Jetson-A privately
- no public port forwarding needed
- docs explain how it was enrolled

## Phase 5: Manufacturing integration

Add:

- Digital Factory status workflow
- optional API polling
- optional CNCjs if physically appropriate

Success:

- expected printer fleet is visible
- Cubiko path is documented and safety-bounded

## Phase 6: Hardening

Add:

- backups
- known-good snapshots
- incident review cadence
- model eval cadence
- service update cadence
