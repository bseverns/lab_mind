# Lab Brain
Standalone documentation base for a single-box Jetson Orin Nano office/studio assistant.

This kit is intentionally **bigger than necessary**.
The goal is to give you one first-copy bundle with enough structure that you can delete what you do not need instead of discovering missing scaffolding later.

## What this bundle assumes
- one primary Jetson Orin Nano dev kit (`Jetson-A`)
- microSD as the easiest rebuild path
- NVMe SSD attached for durable Docker data and service volumes
- browser-first operation
- private remote access via a Headscale-managed tailnet
- Digital Factory remains the printer-side cloud pane
- Cubiko is optional and only local if physically near the Jetson

## Included
- operator docs
- intern docs
- Ben fast-path docs
- architecture and service notes
- Digital Factory and printer fleet flows
- Headscale placeholders
- Docker / Compose examples
- systemd examples
- browser bookmark import file
- scripts and checklists
- restore / incident / maintenance notes
- inventory and rebuild templates

## Start here
Open:
- `docs/00_START_HERE.md`
- `docs/06_BLANK_CARD_REBUILD.md`
- `ops/jetson/HEADSCALE_VALUES.example`

## Important posture
This is a **private helper box**, not a public internet appliance.
Do not expose the internal tools directly to the public web.
Use the Headscale-controlled private path for operator access and keep public printer-facing work inside Digital Factory.

## Suggested repo layout
This bundle is already arranged as a repo-shaped starter. If you want to turn it into a live repository, initialize Git at this root and start pruning.
