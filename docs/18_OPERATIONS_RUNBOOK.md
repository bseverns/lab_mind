# 18 — Operations Runbook

## 60-second check

On Jetson-A:

```bash
hostname
lsblk
df -h
docker ps
curl -fsS http://127.0.0.1:11434/api/tags || true
```

On Jetson-B:

```bash
hostname
docker ps
bash /srv/labbrain/scripts/lab_status_check.sh || true
```

On Jetson-C:

```bash
hostname
docker ps
curl -fsS http://localhost || true
```

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

- NVMe is missing
- Docker will not start
- model server crashes repeatedly
- Digital Factory account/workspace is unclear
- Headscale values are unknown
- CNC movement is unexpected
- a safety concern appears
