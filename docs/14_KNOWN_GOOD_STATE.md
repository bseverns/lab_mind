# 14 — Known-Good State

## Purpose

A known-good-state snapshot lets the operator answer:

> What changed since this worked?

## Capture after

- a successful blank-card rebuild
- a working class day
- adding/removing a service
- changing Headscale enrollment
- changing model tags
- changing printer fleet names

## Capture items

- date/time
- operator
- hostnames
- IPs/tailnet names
- Docker versions
- running containers
- model list
- disk layout
- mounted NVMe confirmation
- dashboard URLs
- Digital Factory visible fleet count
- CNC connection status, if enabled
- docs version/hash if available

Use:

- `scripts/capture_known_good_state.sh`
- `templates/KNOWN_GOOD_STATE.md`

## Storage

Store snapshots on:

- Jetson-A local disk
- Jetson-C archive
- optionally another secure backup location

Do not include secrets.
