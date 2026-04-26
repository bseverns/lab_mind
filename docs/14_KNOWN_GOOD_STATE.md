# 14 - Known-Good State

A known-good-state snapshot lets the operator answer:

> What changed since this worked?

## Capture after

- a successful blank-card rebuild
- a working class day
- adding or removing a service
- changing Headscale enrollment
- changing model tags
- changing printer fleet names

## Capture items

- date and time
- operator
- hostnames
- IPs and tailnet names
- Docker versions
- running containers
- model list
- disk layout
- storage mount confirmation
- dashboard URLs
- Digital Factory visible fleet count
- CNC connection status, if enabled
- docs version or hash if available

Use:

- `scripts/capture_known_good_state.sh`
- `templates/KNOWN_GOOD_STATE.md`

## Storage

Store snapshots on:

- the R900 archive
- a mirrored copy if one is later approved

Do not make Jetson-C the only archive anymore.
Do not include secrets.
