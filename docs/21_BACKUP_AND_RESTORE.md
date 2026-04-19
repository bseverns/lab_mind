# 21 — Backup and Restore

## What to back up

Back up:

- lab-brain repo docs
- dashboard files
- Compose files
- `.env.example` files
- known-good-state snapshots
- incident logs
- model test logs
- Digital Factory check records
- CNC checklists

Do not casually back up:

- raw secrets
- preauth keys
- student data
- unrestricted logs

## Where to back up

Minimum:

- Jetson-A local NVMe
- Jetson-C archive copy

Better:

- plus off-device secure backup

## Restore priority

1. Docs and checklists
2. Docker/Compose service definitions
3. service volumes
4. model files, if not easily re-pulled
5. known-good-state archive

## Restore drill

Monthly:

1. Pretend Jetson-A is blank.
2. Use Jetson-C docs to recover the service map.
3. Restore cockpit docs.
4. Recreate containers from Compose.
5. Confirm Open WebUI works.
6. Record outcome in `checklists/MONTHLY_RESTORE_DRILL.md`.
