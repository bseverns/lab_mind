# 01 — Network Reality

## Network layers

The lab-brain network has three layers:

1. **Local LAN** — office network, printers, Jetsons, tablets.
2. **Private tailnet** — Headscale-managed remote educator/admin access.
3. **Cloud services** — Digital Factory, GitHub, package registries, software updates.

Do not confuse those layers.

## What belongs where

| Traffic | Route | Notes |
|---|---|---|
| Educator remote access to Jetson-A | Headscale/tailnet | private, authenticated |
| Open WebUI from office tablet | LAN or tailnet | never public by default |
| Digital Factory | public cloud browser/API | printer ecosystem source of truth |
| Cubiko CNC control | local USB / local web UI | keep physical safety local |
| Docker/package updates | public internet | controlled maintenance window preferred |
| Student/general browser traffic | normal public web | do not send through lab tailnet |

## DNS names to reserve

Editable suggestions:

```text
labbrain-a.local
labbrain-b.local
labbrain-c.local
labbrain-a.tail.creatempls.org
labbrain-b.tail.creatempls.org
labbrain-c.tail.creatempls.org
hs.creatempls.org
```

## Avoid

- exposing Portainer publicly
- exposing Open WebUI publicly
- exposing Node-RED publicly
- exposing CNCjs publicly
- making Headscale a general office VPN
- making the lab-brain the router for the room

## Good enough first target

At first, the network only needs to support:

- a browser on the LAN opening Jetson-A cockpit
- educator remote access to Jetson-A through Headscale
- Jetson-B checking Jetson-A health
- Jetson-C serving static docs
