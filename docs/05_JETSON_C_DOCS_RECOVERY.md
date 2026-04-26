# 05 - Jetson-C Recovery Notes

This file keeps the old Jetson-C filename alive for compatibility.
The actual recovery memory now belongs on the R900.

Jetson-C is therefore treated as an edge support node, not the archive.

## What Jetson-C can do

- host a local dashboard
- run service polling
- act as a nearby helper for a machine or display
- mirror a small operational view if needed

## What Jetson-C should not do

- be the primary docs home
- hold the only copy of the archive
- become a surprise model server
- grow into a second assistant

## Where recovery now lives

Use these files instead of assuming Jetson-C is the memory node:

- `docs/14_KNOWN_GOOD_STATE.md`
- `docs/19_FAILURE_MODES_AND_RECOVERY.md`
- `docs/21_BACKUP_AND_RESTORE.md`
- `templates/KNOWN_GOOD_STATE.md`
- `templates/INCIDENT_LOG.csv`

## Recovery rule

If a beginner cannot understand the rebuild path from the R900 docs mirror, the recovery path is not clear enough.
