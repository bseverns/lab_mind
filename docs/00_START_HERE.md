# Start Here

## Summary
This is the landing page for the standalone Jetson lab-brain kit.

Choose the shortest path for your role:

- first rebuild from blank cards: `06_BLANK_CARD_REBUILD.md`
- intern / assistant: `21_INTERN_ONE_PAGER.md`
- Ben fast path: `22_BEN_FAST_PATH.md`
- remote-access setup: `11_HEADSCALE_JETSON_SIDE.md`
- Digital Factory and printer checks: `09_DIGITAL_FACTORY_SETUP.md`

## Core idea
This deployment is intentionally narrow:

- one strong Jetson instead of three half-busy ones
- Docker on NVMe
- browser-first services
- private remote access
- Digital Factory for the MakerBot / UltiMaker side
- optional local CNC control through `cncjs`

## Canonical surface
Pinned browser tabs should become the normal control room:

1. Digital Factory
2. Open WebUI
3. Portainer
4. Node-RED
5. Syncthing
6. CNCjs only if the Cubiko is attached locally

## If you are overwhelmed
Read only these three files:

1. `06_BLANK_CARD_REBUILD.md`
2. `09_DIGITAL_FACTORY_SETUP.md`
3. `ops/jetson/HEADSCALE_VALUES.example`
