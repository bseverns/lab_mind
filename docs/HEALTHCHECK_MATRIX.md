# Healthcheck Matrix

This page says what healthy means for each core service.
Use it with the runbook and the status scripts.

## Core checks

| Service | Healthy signal | Probe | Fallback |
|---|---|---|---|
| R900 cockpit | internal site loads | browser open or `curl` | check Caddy and docs mount |
| Open WebUI | page loads and models list opens | browser or API response | check model backend and env |
| llama.cpp backend | `/v1/models` returns data | `curl -fsS http://.../v1/models` | restart backend or fall back to local profile |
| Portainer | UI loads privately | browser open | check container and socket path |
| Node-RED | editor loads privately | browser open | restart container |
| docs mirror | internal docs load | browser open | check R900 storage and web server |
| Syncthing | sync UI reachable | browser open | check container and data path |
| CNCjs | UI loads only when enabled | browser open | disable if machine path is not real |

## What healthy means

- the service responds on the expected address
- the service is on the expected node
- the node role matches the service
- the fallback path is known

## Notes

- healthchecks should not be vague
- if a service has no clear probe, the docs are not finished yet
