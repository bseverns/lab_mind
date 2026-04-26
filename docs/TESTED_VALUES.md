# Tested Values

This page holds the exact values that have been tested in the room.
Use it as the source of truth for rebuilds.

Only put values here after they have been verified.
If a value is not tested, leave it out or mark it `EDIT_ME`.

## Hostnames

| Name | Value | Tested on |
|---|---|---|
| R900 | `EDIT_ME` | `EDIT_ME` |
| Jetson-A | `EDIT_ME` | `EDIT_ME` |
| Jetson-B | `EDIT_ME` | `EDIT_ME` |
| Jetson-C | `EDIT_ME` | `EDIT_ME` |

## URLs

| Service | URL | Tested on |
|---|---|---|
| Cockpit | `EDIT_ME` | `EDIT_ME` |
| Open WebUI | `EDIT_ME` | `EDIT_ME` |
| Portainer | `EDIT_ME` | `EDIT_ME` |
| Docs mirror | `EDIT_ME` | `EDIT_ME` |
| Digital Factory | `EDIT_ME` | `EDIT_ME` |
| CNCjs | `EDIT_ME` | `EDIT_ME` |

## Ports

| Service | Port | Notes |
|---|---|---|
| Open WebUI | `EDIT_ME` | browser-facing |
| llama.cpp | `EDIT_ME` | private backend |
| Cockpit / Caddy | `EDIT_ME` | local front door |
| Portainer | `EDIT_ME` | spine service |
| Node-RED | `EDIT_ME` | optional spine service |

## Mount paths

| Purpose | Path | Tested on |
|---|---|---|
| Model store | `EDIT_ME` | `EDIT_ME` |
| Open WebUI data | `EDIT_ME` | `EDIT_ME` |
| llama.cpp cache | `EDIT_ME` | `EDIT_ME` |
| Docs mirror | `EDIT_ME` | `EDIT_ME` |
| Portainer data | `EDIT_ME` | `EDIT_ME` |
| Syncthing data | `EDIT_ME` | `EDIT_ME` |

## Storage paths

| Purpose | Path | Notes |
|---|---|---|
| Fast model | `EDIT_ME` | Jetson-A SSD |
| Code model | `EDIT_ME` | Jetson-A SSD or R900 storage |
| Heavy model | `EDIT_ME` | Jetson-A SSD if it fits |
| Remote code model | `EDIT_ME` | R900 storage |

## Compose commands that worked

| Stack | Command | Tested on |
|---|---|---|
| Jetson-A base | `EDIT_ME` | `EDIT_ME` |
| Jetson-A fast | `EDIT_ME` | `EDIT_ME` |
| Jetson-A code | `EDIT_ME` | `EDIT_ME` |
| Jetson-A heavy | `EDIT_ME` | `EDIT_ME` |
| R900 code backend | `EDIT_ME` | `EDIT_ME` |
| Cooperative code mode | `EDIT_ME` | `EDIT_ME` |

## Notes

- this file is for facts, not aspirations
- if a value changes, the old value should stay in the history elsewhere
- do not add secrets
