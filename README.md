# Lab Brain
Standalone documentation base for a single-box Jetson Orin Nano office/studio assistant that we use at our office.

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

## Start here
Open:
- `docs/00_START_HERE.md`
- `docs/06_BLANK_CARD_REBUILD.md`
- `ops/jetson/HEADSCALE_VALUES.example`

## Important posture
This is a **private helper box**, not a public internet appliance.
Do not expose your internal tools directly to the public web.
Use the Headscale-controlled private path for operator access and keep public printer-facing work inside Digital Factory.
