# 23 — Older Jetson Nano Limits and Jobs

## What the old Nanos are good at

- static docs
- health checks
- Node-RED flows
- light scripts
- status dashboards
- Syncthing
- MQTT
- simple camera/sensor jobs
- recovery documentation

## What they are not good at

- largest local code models
- distributed LLM inference for this room
- heavy embeddings over huge corpora
- being reliable high-load GPU servers

## Rule

Use the Nanos to make the lab-brain more reliable, not more theatrical.

## Good Nano jobs

Jetson-B:

- check every service
- publish status
- send alerts
- hold simple flows

Jetson-C:

- host docs
- store snapshots
- keep recovery path alive

## Bad Nano jobs

- “part of the big brain” model cluster
- extra copy of every service
- remote CNC controller from across the room
- secret storage without a security plan
