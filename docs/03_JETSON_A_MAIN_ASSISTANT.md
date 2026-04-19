# 03 — Jetson-A Main Assistant

## Purpose

Jetson-A is the main lab-brain. It hosts the local model, the assistant UI, the primary dashboard, and the most useful private remote access surface.

It should feel like a calm operator station, not a pile of unrelated web apps.

## Required services

- Docker Engine
- Docker Compose v2
- Ollama or llama.cpp server
- Open WebUI
- Portainer
- static cockpit/dashboard page
- Headscale-compatible client
- Syncthing client

## Recommended storage layout

Use microSD for boot and NVMe for durable service data.

```text
/srv/docker
/srv/labbrain
/srv/labbrain/config
/srv/labbrain/data
/srv/labbrain/data/ollama
/srv/labbrain/data/openwebui
/srv/labbrain/data/portainer
/srv/labbrain/data/syncthing
/srv/labbrain/docs
/srv/labbrain/known-good
/srv/labbrain/incidents
```

## Default ports

| Service | Default URL | Notes |
|---|---|---|
| Cockpit | `http://labbrain-a.local` | static landing page |
| Open WebUI | `http://labbrain-a.local:3000` | or proxied path |
| Ollama | `http://127.0.0.1:11434` | bind local unless intentionally proxied |
| Portainer | `https://labbrain-a.local:9443` | private only |
| Syncthing | `http://labbrain-a.local:8384` | private only |
| CNCjs | `http://labbrain-a.local:8000` | only if Cubiko attached |

## Assistant prompt posture

The assistant should be told:

- it is an on-site operations assistant
- it should prefer repo docs and local checklists
- it should ask for exact error text
- it should not invent Headscale values
- it should not claim to control machines unless it truly does
- it should redirect CNC safety questions to human checklist and adult supervision

## Day-one model plan

Use two models:

1. small fast general model for everyday questions
2. larger quantized code model for code and scripts

Document exact model tags in `templates/MODEL_TEST_LOG.csv` once tested.

## Failure rule

If Jetson-A is down, Jetson-C should still serve rebuild docs.
