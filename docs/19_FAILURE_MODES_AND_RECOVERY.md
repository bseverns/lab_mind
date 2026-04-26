# 19 - Failure Modes and Recovery

## Jetson-A will not boot

1. Check power.
2. Check boot media and storage seating.
3. Try a known-good image if needed.
4. Use the R900 docs mirror and rebuild notes.
5. Do not wipe NVMe until its contents are identified.

## R900 will not boot or mount storage

1. Stop assuming the room archive exists.
2. Check power, storage, and network links.
3. Confirm whether docs and backups are still reachable elsewhere.
4. Document the state before changing disks or filesystems.

## Jetson-A storage or model service fails

1. Check `docker ps`.
2. Check logs.
3. Confirm the model service is alive.
4. Confirm disk is not full.
5. Switch to fast mode if the assistant is still usable.

## Model too slow

1. Switch to fast model.
2. Reduce context.
3. Reduce max output.
4. Confirm no other heavy service is running.
5. Record the result in the model test log.

## Digital Factory missing printer

1. Confirm correct workspace.
2. Confirm printer power and network.
3. Record the missing machine.
4. Avoid renaming unless sure.

## Headscale remote access fails

1. Confirm LAN service works first.
2. Confirm the node appears in the Headscale node list.
3. Confirm the educator device appears.
4. Check tailnet DNS and hostname values.
5. Use a raw tailnet IP if DNS is uncertain.

## Network switch or LAN failure

1. Check power to the switch.
2. Check cables to the spine and assistant node.
3. Confirm the room still has a browser path to the archive.
4. Do not assume Wi-Fi will save the room.

## Nano failure

1. Treat the Nano as replaceable.
2. Reimage or swap the edge node.
3. Rebuild the status role from the docs.

## CNCjs weirdness

1. Stop the job if needed.
2. Do not continue from dashboard alone.
3. Check USB, controller, workholding, and coordinates.
4. Re-run the pre-job checklist.
