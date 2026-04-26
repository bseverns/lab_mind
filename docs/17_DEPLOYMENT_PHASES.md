# 17 - Deployment Phases

## Phase 0: Paper map

Before installing anything, fill:

- `templates/NODE_INVENTORY.csv`
- `templates/PRINTER_INVENTORY.csv`
- `templates/CNC_INVENTORY.csv`
- `templates/SERVICE_MATRIX.csv`
- `templates/HEADSCALE_VALUES.example`
- `ops/lab/hostnames.example`
- `ops/lab/service-urls.example`

## Phase 1: Bring up the server spine

Install the R900 as the infrastructure host.

Add:

- backups
- shared storage
- monitoring
- dashboards
- Portainer
- docs mirror
- known-good-state archive

Success:

- the R900 can serve the internal operator map
- the archive exists before the assistant is treated as precious
- the room has a recovery spine

## Phase 2: Keep Jetson-A as the assistant node

Install:

- Open WebUI
- local model serving
- code-assistant workflow pieces
- local docs/RAG client or index
- browser-first cockpit entry

Success:

- the assistant opens in a browser
- model tests are logged
- Jetson-A is reachable privately
- the R900 still holds the archive
- the staged build pieces are understandable by an intern

## Phase 3: Assign edge roles to Nanos and Pis

Install:

- room status panels
- service polling
- local dashboards
- machine-adjacent helpers
- kiosks and signage
- USB or sensor bridges

Success:

- the room can be understood without the assistant
- the Nanos and Pis can fail without damaging the spine
- edge devices are replaceable and documented

## Phase 4: Add monitoring, dashboard, and recovery flows

Wire up:

- incident logging
- known-good-state capture
- restore drill path
- browser cockpit
- private access boundaries

Success:

- a beginner can see what is up
- a beginner can find the recovery path
- the lab can be restored from the docs and archive

## Later phases

Only after the above works should you consider:

- extra automation
- optional CNCjs
- optional future VLANs
- any new edge role

Do not add complexity before the room can be rebuilt.
