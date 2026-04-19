# 02 — Node Roles: Three Jetsons

## Core idea

Jetson-A thinks. Jetson-B watches. Jetson-C remembers.

Do not treat the two old Nanos as a distributed GPU cluster. They are too small and too slow to make that worth the operator cost. They are still useful, but their usefulness is operational.

## Jetson-A: main assistant

Jetson-A gets the heaviest, most interactive work:

- local LLM server
- Open WebUI
- code-assistant model
- Portainer
- primary cockpit page
- optional CNCjs if physically attached to Cubiko
- RAG/index serving
- known-good-state capture

## Jetson-B: ops sentinel

Jetson-B watches the room:

- Node-RED flows
- scheduled health checks
- Digital Factory polling helper, if implemented
- uptime checks
- notifications
- MQTT broker, if used
- simple status dashboard

## Jetson-C: docs and recovery

Jetson-C keeps the room from losing its map:

- static docs site
- Syncthing node
- backups and snapshots
- known-good-state archive
- incident logs mirror
- rebuild instructions
- emergency landing page for tablet use

## Service placement matrix

| Service | Jetson-A | Jetson-B | Jetson-C | Notes |
|---|---:|---:|---:|---|
| Ollama / llama.cpp | yes | no | no | A only |
| Open WebUI | yes | no | maybe mirror link | A is canonical |
| Portainer | yes | optional agent | optional agent | keep simple |
| Node-RED | optional | yes | optional | B is best home |
| Static docs | yes | optional | yes | C should survive A rebuild |
| Syncthing | yes | maybe | yes | C is archive anchor |
| CNCjs | maybe | maybe | no | whichever is physically near Cubiko |
| Digital Factory browser/API helper | yes | yes | no | B can poll; A can display |
| MQTT broker | maybe | yes | no | only if needed |
| Backups | yes | maybe | yes | C stores copies |

## Do not run everywhere

Do not install every service on every board. Duplication feels safe until it becomes drift.

One canonical home per service. Optional mirrors only when the mirror has a clear recovery purpose.
