# Service Stack

## Keep
- Docker Engine
- Docker Compose v2
- Portainer
- Ollama
- Open WebUI
- Node-RED
- Syncthing
- Headscale-compatible client

## Optional
- CNCjs
- whisper / transcription jobs
- backup sync target tooling

## Not recommended on day 1
- Home Assistant unless it clearly earns its keep
- distributed multi-node control
- public reverse proxying of the internal services
- heavyweight observability stacks

## Why this stack
The machine should behave like a private appliance:

- Portainer = stack control
- Open WebUI + Ollama = assistant surface
- Node-RED = glue and automations
- Syncthing = simple file movement
- CNCjs = local CNC control only if needed
