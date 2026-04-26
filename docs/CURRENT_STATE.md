# Current State

This page describes what is physically present and currently intended to be in service.
Keep it blunt.

Do not confuse this page with the design docs.
Do not write future hopes here.

## As of

- Date: `EDIT_ME`
- Last verified by: `EDIT_ME`
- Verification method: `EDIT_ME`

## Physical hardware present

| Item | Present | Notes |
|---|---|---|
| Dell PowerEdge R900 | `EDIT_ME` | infrastructure spine |
| Jetson-A Orin Nano | `EDIT_ME` | live assistant node |
| Jetson Nano B | `EDIT_ME` | edge/support |
| Jetson Nano C | `EDIT_ME` | edge/support |
| Raspberry Pi fleet | `EDIT_ME` | disposable edge appliances |
| Ethernet switch | `EDIT_ME` | room containment layer |
| Digital Factory cloud access | `EDIT_ME` | printer source of truth |
| Headscale control plane | `EDIT_ME` | private access only |

## Nodes actually installed

| Node | Installed | Hostname | Role |
|---|---|---|---|
| R900 | `EDIT_ME` | `EDIT_ME` | spine |
| Jetson-A | `EDIT_ME` | `EDIT_ME` | assistant/model host |
| Jetson-B | `EDIT_ME` | `EDIT_ME` | edge support |
| Jetson-C | `EDIT_ME` | `EDIT_ME` | edge support |
| Pi nodes | `EDIT_ME` | `EDIT_ME` | kiosks, bridges, sensors |

## Services actually running

| Service | Running | Where | Notes |
|---|---|---|---|
| Cockpit / internal site | `EDIT_ME` | `EDIT_ME` | browser front door |
| Open WebUI | `EDIT_ME` | `EDIT_ME` | assistant surface |
| Local model server | `EDIT_ME` | `EDIT_ME` | Jetson-A or R900 backend |
| Portainer | `EDIT_ME` | `EDIT_ME` | spine management |
| Docs mirror | `EDIT_ME` | `EDIT_ME` | internal recoverability |
| Node-RED | `EDIT_ME` | `EDIT_ME` | optional spine service |
| Syncthing | `EDIT_ME` | `EDIT_ME` | if used |
| CNCjs | `EDIT_ME` | `EDIT_ME` | optional, only when real |

## What is not yet real

- placeholder hostnames
- unverified URLs
- untested model images
- optional services not yet installed
- any CNC or printer integration that has not been seen live

## Rule

If it is not physically confirmed, it does not belong here as a fact.
