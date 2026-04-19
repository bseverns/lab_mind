# 10 — Digital Factory Companion

## Purpose

Digital Factory remains the source of truth for MakerBot/UltiMaker printer management.

The lab-brain does not replace it. It helps humans remember what should be there.

## Expected fleet

Update this if the room changes.

| Machine type | Count | Notes |
|---|---:|---|
| MakerBot Sketch | 3 | Digital Factory managed |
| MakerBot Sketch+ | 2 | Digital Factory managed |
| UltiMaker/MakerBot Method X | 1 | Digital Factory managed |

## First check

Open Digital Factory and confirm:

- correct account
- correct workspace
- all expected printers visible
- printer names make sense
- no mystery duplicate machines
- webcam/snapshot view available where supported
- queue/status information visible

## Lab-brain companion tasks

Jetson-A can display the bookmark and checklist.
Jetson-B can eventually poll APIs or run status checks if credentials/API approach is finalized.
Jetson-C can archive checklists and incident notes.

## Missing printer flow

1. Do not rename things first.
2. Record which printer is missing.
3. Check printer power.
4. Check network connection.
5. Check Digital Factory workspace/account.
6. Restart only the affected printer if appropriate.
7. Record what fixed it.

Use:

- `templates/DIGITAL_FACTORY_CHECK.md`
- `templates/INCIDENT_LOG.csv`
