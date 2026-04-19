# 19 — Failure Modes and Recovery

## Jetson-A will not boot

1. Check power.
2. Check SD card seating.
3. Try known-good flashed card.
4. Use Jetson-C docs for rebuild path.
5. Do not wipe NVMe until its contents are identified.

## NVMe missing

1. Stop Docker setup.
2. Run `lsblk`.
3. Check physical seating.
4. Document before formatting anything.

## Open WebUI down

1. Check `docker ps`.
2. Check logs.
3. Confirm Ollama is up.
4. Confirm disk is not full.

## Model too slow

1. Switch to fast model.
2. Reduce context.
3. Reduce max output.
4. Confirm no other heavy service is running.
5. Record result in model test log.

## Digital Factory missing printer

1. Confirm correct workspace.
2. Confirm printer power/network.
3. Record missing machine.
4. Avoid renaming unless sure.

## Headscale remote access fails

1. Confirm LAN service works first.
2. Confirm Jetson appears in Headscale node list.
3. Confirm educator device appears.
4. Check tailnet DNS/name.
5. Use raw tailnet IP if DNS is uncertain.

## CNCjs weirdness

1. Stop job if needed.
2. Do not continue from dashboard alone.
3. Check USB, controller, workholding, coordinates.
4. Re-run pre-job checklist.
