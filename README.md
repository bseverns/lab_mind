# Lab Brain Stack: Three-Jetson Addendum

This addendum reorients the standalone `lab_brain` repo around the current hardware reality:

- **Jetson-A**: Jetson Orin Nano 8GB with NVMe. Main assistant/model host, cockpit, and private educator doorway.
- **Jetson-B**: older Jetson Nano. Ops sentinel: health checks, Node-RED, printer/CNC status glue, alerts.
- **Jetson-C**: older Jetson Nano. Documentation/recovery node: static docs mirror, Syncthing, backups, known-good-state archive.

The point is not to build a fragile cluster. The point is to distribute responsibilities. Jetson-A thinks. Jetson-B watches. Jetson-C remembers.

## How to use this bundle

Copy these folders into the existing standalone `lab_brain` repo:

```bash
cp -R docs ops compose scripts systemd templates handoff checklists dashboard <LAB_BRAIN_REPO>/
```

Then open:

1. `docs/00_ORIENTATION.md`
2. `docs/02_NODE_ROLES_THREE_JETSONS.md`
3. `docs/06_MODEL_STRATEGY_CODE_ASSISTANT.md`
4. `docs/17_DEPLOYMENT_PHASES.md`
5. `handoff/INTERN_ONE_PAGER.md`

## Design rule

Do not distribute the model across the old Nanos. Distribute the jobs around the model.

That keeps the room useful, legible, and recoverable.
