# 07 — Service Placement Matrix

## Canonical placement

| Service | Primary node | Backup/mirror | Why |
|---|---|---|---|
| Open WebUI | Jetson-A | none | assistant surface |
| Ollama/llama.cpp | Jetson-A | none | only Orin has headroom |
| Portainer | Jetson-A | none | single-machine management first |
| Cockpit static page | Jetson-A | Jetson-C mirror | A is daily entry; C survives rebuild |
| Node-RED | Jetson-B | Jetson-A optional | automation/watchdog role |
| MQTT broker | Jetson-B | none | only if needed |
| Static docs | Jetson-C | Jetson-A mirror | recovery-first |
| Syncthing | Jetson-A + C | B optional | docs/snapshots movement |
| Known-good archive | Jetson-C | Jetson-A copy | C remembers |
| CNCjs | physically closest node | none | do not remote CNC carelessly |
| Digital Factory helper scripts | Jetson-B | Jetson-A | status polling not model work |

## First implementation

Start with:

- Jetson-A: Open WebUI, Ollama, Portainer, cockpit, Syncthing
- Jetson-B: Node-RED, status checks
- Jetson-C: static docs, Syncthing, known-good archive

Then add CNCjs only after the physical machine placement is clear.

## Drift warning

If the same service exists on two nodes, one must be named canonical.

Mirrors are for recovery. Canonical services are for operations.
