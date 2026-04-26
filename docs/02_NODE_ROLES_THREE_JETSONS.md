# 02 - Node Roles: Three Jetsons

The file name is historical.
The architecture is current.

The old mental model gave Jetson-A the thinking role and split the support work across the two Nanos.
That is still useful, but the memory role now lives on the R900.

## Current role map

| Node | Main job | Secondary job | Not for |
|---|---|---|---|
| R900 | spine services | archive and recovery memory | large-model inference by default |
| Jetson-A | live assistant node | private educator access | public app hosting |
| Jetson-B | edge support node | room status and polling | heavy compute or archival duty |
| Jetson-C | edge support node | local dashboards and helper tasks | heavy compute or archival duty |
| Pi nodes | disposable edge appliances | kiosks, bridges, signage, sensors | central services |

## What the spine owns

The R900 is the durable layer:

- backups
- shared storage
- monitoring
- dashboards
- Portainer server
- Node-RED and/or MQTT if needed
- docs mirror or static internal site
- known-good-state archive
- internal operational memory

## What Jetson-A owns

Jetson-A is the only node that should feel like an assistant:

- Open WebUI
- local model serving
- code-assistant workflows
- local docs and RAG
- browser-first educator access
- optional CNCjs if physically appropriate

## What Jetson-B and Jetson-C own

The Jetson Nanos are support nodes:

- room status
- service polling
- local dashboards
- machine-adjacent helper roles

They should not be expected to carry large models, long-lived archives, or the main operator experience.

## What Pis own

The Pi fleet exists so the room can have tiny replaceable devices:

- kiosk screens
- simple signage
- USB bridges
- machine sensors
- cameras

Replace them without changing the architecture.

## Rule of thumb

- If the job is about storing or restoring the room, put it on the R900.
- If the job is about assisting a person, put it on Jetson-A.
- If the job is about watching the edges, put it on the Nanos or Pis.
