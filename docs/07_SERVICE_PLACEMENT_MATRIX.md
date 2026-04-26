# 07 - Service Placement Matrix

This is the canonical service placement map.
If a service is not in this table, it should not quietly appear somewhere else.

## Service placement by node

| Service | R900 | Jetson-A | Jetson-B/C | Pi nodes | Notes |
|---|---|---|---|---|---|
| Backups | primary | mirror only | no | no | R900 is the backup spine |
| Shared storage | primary | read if needed | no | no | keep the room recoverable |
| Monitoring | primary | view only | display or probe | tiny sensors only | dashboards belong on the spine |
| Dashboards | primary | browser client | local panel | kiosk/display | one screen should show the truth |
| Portainer server | primary | optional client | no | no | central Docker management belongs on the spine |
| Node-RED | primary if used | view only | helper consumer | no | avoid inventing a cluster of automation |
| MQTT broker | primary if used | consumer only | consumer only | sensor publisher if needed | only if the room needs it |
| Docs mirror / static internal site | primary | client or small mirror | no | no | recovery memory belongs to the spine |
| Known-good-state archive | primary | copy only | no | no | archive and restore reference |
| Internal operational memory | primary | read only | no | no | incident notes, inventory, state maps |
| Open WebUI | no | primary | no | no | assistant surface lives on Jetson-A |
| Local model serving | no | primary | no | no | keep models on the Orin |
| Code-assistant workflows | no | primary | no | no | the assistant node owns this |
| Local docs/RAG | mirror/index | primary | no | no | docs can be mirrored from the spine |
| Browser-first educator access | no | primary | no | no | do not rely on remote desktop |
| Room status panels | no | no | primary | kiosk/display only | Jetson-B/C are edge support nodes |
| Service polling | no | no | primary | helper probes | keep these lightweight |
| Machine-adjacent helper roles | no | no | primary | bridge/display/sensor | use the nearest replaceable device |
| Kiosks and signage | no | no | helper only | primary | Pis are the disposable edge layer |
| USB or machine bridges | no | no | helper only | primary | keep the bridge close to the device |
| Sensors/cameras | no | no | helper only | primary | replaceable and boring |
| CNCjs | optional | optional if physically appropriate | no | optional if physically appropriate | only where the controller is actually attached |
| Digital Factory | cloud browser | cloud browser | cloud browser | cloud browser | not self-hosted here |

## Exact placements

### R900

Place here:

- backups
- shared storage
- monitoring
- dashboards
- Portainer server
- Node-RED if the lab needs it
- MQTT if the lab needs it
- docs mirror or static internal site
- known-good-state archive
- internal operational memory

### Jetson-A

Place here:

- Open WebUI
- local model serving
- code-assistant workflows
- local docs/RAG
- browser-first educator access
- optional CNCjs only if the machine is physically adjacent and the safety path is documented

### Jetson-B and Jetson-C

Place here:

- room status
- service polling
- local dashboards
- machine-adjacent helper roles

Do not place the assistant model, the archive, or the central service spine here.

### Pi nodes

Place here:

- kiosks
- signage
- displays
- USB bridges
- sensors
- cameras

Keep Pi roles disposable.

## Drift warning

If a service exists in more than one place, one node must be canonical and the others must be named mirrors or clients.
