# Lab Mind

This repository documents the lab as a recoverable, boring, mixed-hardware system.

Current intended topology:

- **Dell PowerEdge R900**: infrastructure spine for backups, shared storage, monitoring, dashboards, Portainer server, docs mirror, known-good-state archive, and internal operational memory.
- **Jetson-A**: Jetson Orin Nano live assistant node for Open WebUI, local model serving, code-assistant workflows, local docs/RAG, and browser-first educator access.
- **Jetson Nano B/C**: edge/support nodes for room status, service polling, local dashboards, and machine-adjacent helper roles.
- **Raspberry Pis**: disposable edge appliances for kiosks, displays, USB/machine bridges, signage, and sensors/cameras when useful.
- **Ethernet switch**: the wiring and containment layer for the whole room.
- **Headscale**: private control plane for remote access, not the public app surface.
- **Digital Factory**: source of truth for 3D printer fleet management.
- **Cubiko/CNC**: optional, physically attached integration only.

Design constraints:

- Do not treat this as a Kubernetes cluster.
- Do not distribute one model across all machines.
- Keep public/browser traffic separate from private control/model traffic.
- Keep the architecture boring, durable, and recoverable.
- Prefer browser-first operations over remote desktop.
- Prefer editable placeholders over invented final values.

## Read This First

Start with:

1. [`docs/index.md`](docs/index.md)
2. [`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md)
3. [`docs/TESTED_VALUES.md`](docs/TESTED_VALUES.md)
4. [`docs/KNOWN_GOOD_STATE.md`](docs/KNOWN_GOOD_STATE.md)
5. [`docs/EXPERIMENTAL_SURFACES.md`](docs/EXPERIMENTAL_SURFACES.md)
6. [`docs/00_ORIENTATION.md`](docs/00_ORIENTATION.md)
7. [`docs/01_NETWORK_REALITY.md`](docs/01_NETWORK_REALITY.md)
8. [`docs/07_SERVICE_PLACEMENT_MATRIX.md`](docs/07_SERVICE_PLACEMENT_MATRIX.md)
9. [`docs/17_DEPLOYMENT_PHASES.md`](docs/17_DEPLOYMENT_PHASES.md)
10. [`docs/06_MODEL_STRATEGY_CODE_ASSISTANT.md`](docs/06_MODEL_STRATEGY_CODE_ASSISTANT.md)
11. [`docs/25_JETSON_A_MODEL_BUILD_PIECES.md`](docs/25_JETSON_A_MODEL_BUILD_PIECES.md)
12. [`docs/27_COOPERATIVE_CODE_MODE.md`](docs/27_COOPERATIVE_CODE_MODE.md)
13. [`docs/BOARD_CASE_FOR_INFRASTRUCTURE.md`](docs/BOARD_CASE_FOR_INFRASTRUCTURE.md)
14. [`docs/handoff/INTERN_ONE_PAGER.md`](docs/handoff/INTERN_ONE_PAGER.md)
15. [`docs/handoff/OPERATOR_TOGGLE_CHECKLIST.md`](docs/handoff/OPERATOR_TOGGLE_CHECKLIST.md)
16. [`docs/handoff/MODEL_SWITCH_CARD.md`](docs/handoff/MODEL_SWITCH_CARD.md)
17. [`docs/handoff/MODEL_CHOICE_LADDER.md`](docs/handoff/MODEL_CHOICE_LADDER.md)

## Where The Editable Placeholders Live

- `ops/lab/` contains hostnames, URLs, Headscale values, and workspace placeholders.
- `ops/lab/private-names.example` and `ops/lab/image-values.example` hold the canonical private naming and image pin examples.
- `compose/jetson-a-llamacpp.compose.yml` is the local-model stack template for Jetson-A.
- `compose/jetson-a-base.compose.yml`, `compose/jetson-a-fast.compose.yml`, `compose/jetson-a-code.compose.yml`, and `compose/jetson-a-heavy.compose.yml` are the staged build pieces.
- `compose/r900-code.compose.yml` and `compose/jetson-a-remote-code.compose.yml` are the optional remote code backend pieces.
- `templates/MODEL_SHORTLIST.example.md` is the candidate model shortlist.
- `templates/` contains inventory and recovery templates.
- `dashboard/` contains a simple browser cockpit starter.
- `scripts/check_docs_integrity.sh` and `scripts/check_image_pins.sh` are guardrails for the docs and compose layer.

## Build The Wiki

Use the wiki build helper when you want a static site:

```bash
./scripts/build_wiki.sh
```

Install the docs dependencies first if needed:

```bash
python3 -m pip install -r requirements-wiki.txt
```

Use `mkdocs serve` if you want a live preview while editing.

## Publish The Wiki

The wiki is set up to publish from GitHub Actions on pushes to `main`.

Before the first publish, set the repository Pages source to GitHub Actions in GitHub settings.
Then push to `main` and let the workflow build and deploy the site.

The workflow lives at:

- [`.github/workflows/publish-wiki.yml`](.github/workflows/publish-wiki.yml)

## Rule Of Thumb

The R900 stores and restores the room. Jetson-A talks to people. The Nanos and Pis do edge work. Nothing should depend on magic that cannot be rebuilt from the docs.
