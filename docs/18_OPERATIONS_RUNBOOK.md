# 18 - Operations Runbook

This runbook is intentionally plain.
The goal is to know what to check before making changes.

## 60-second check

On the R900:

```bash
hostname
df -h
docker ps
```

On Jetson-A:

```bash
hostname
lsblk
docker ps
MODEL_SERVER_URL="${MODEL_SERVER_URL:-${OLLAMA_URL:-}}"
if [ -n "$MODEL_SERVER_URL" ]; then
  curl -fsS "$MODEL_SERVER_URL/api/tags" || true
  curl -fsS "$MODEL_SERVER_URL/v1/models" || true
else
  echo "set MODEL_SERVER_URL to the private backend URL"
fi
```

On Jetson-B or Jetson-C:

```bash
hostname
docker ps
curl -fsS http://localhost || true
```

## Monitoring expectations

The spine should answer:

- are backups running
- is shared storage mounted
- is the docs mirror available
- is Portainer alive
- are dashboards loaded

The assistant node should answer:

- is the model server up
- is Open WebUI up
- is the local docs/RAG path available

The edge nodes should answer:

- are room status cards available
- are service polls working
- are machine-adjacent helper displays alive

## Class-day startup

Use:

- `checklists/CLASS_STARTUP.md`

## Class-day shutdown

Use:

- `checklists/CLASS_SHUTDOWN.md`

## Weekly maintenance

Use:

- `checklists/WEEKLY_MAINTENANCE.md`

## Monthly restore drill

Use:

- `checklists/MONTHLY_RESTORE_DRILL.md`

## When to stop

Stop changing things and document if:

- the R900 archive is not reachable
- shared storage is missing
- Jetson-A storage or model service fails repeatedly
- Digital Factory account or workspace is unclear
- Headscale values are unknown
- CNC movement is unexpected
- a safety concern appears
