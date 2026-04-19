# 04 — Jetson-B Ops Sentinel

## Purpose

Jetson-B is the watchful node. It does not need to be clever. It needs to be persistent.

It answers:

- Is Jetson-A alive?
- Are the key services responding?
- Is Digital Factory reachable?
- Is the docs node reachable?
- Is the CNC dashboard reachable, if enabled?
- Is the class-day cockpit green/yellow/red?

## Recommended services

- Node-RED
- lightweight status scripts
- optional MQTT broker
- optional simple static dashboard
- optional Uptime Kuma or similar if you decide the overhead is worth it

## Minimal checks

Run every few minutes:

```bash
ping -c 1 labbrain-a.local
curl -fsS http://labbrain-a.local || true
curl -fsS http://labbrain-a.local:3000 || true
curl -kfsS https://labbrain-a.local:9443 || true
curl -fsS http://labbrain-c.local || true
```

## Status categories

| Color | Meaning | Action |
|---|---|---|
| Green | ready for class | proceed |
| Yellow | degraded but usable | record and continue carefully |
| Red | not ready | stop and fix basics |

## What Jetson-B should not do

- run the main code model
- become the only dashboard
- store the only copy of docs
- control the CNC unless it is physically placed beside the CNC

## Output

Jetson-B should publish a simple status summary to:

- a local JSON file
- a dashboard card
- optional Node-RED UI
- optional MQTT topic

Example topic names:

```text
labbrain/status/jetson-a
labbrain/status/digital-factory
labbrain/status/cubiko
labbrain/status/docs
```
