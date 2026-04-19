# 05 — Jetson-C Docs and Recovery

## Purpose

Jetson-C is the memory node.

It should keep enough instructions available that someone can rebuild Jetson-A while Jetson-A is unavailable.

## Required jobs

- serve static docs
- keep a synced copy of the lab-brain repo/docs
- store known-good-state snapshots
- store incident logs
- store printable checklists
- keep a copy of Headscale placeholder values without secrets

## Recommended services

- Caddy or nginx for static docs
- Syncthing
- cron/systemd timers for snapshots
- simple landing page

## Docs landing page

The landing page should link to:

- Intern one-pager
- Blank-card rebuild
- Jetson-A service map
- Headscale values template
- Digital Factory check
- Cubiko checklist
- Incident log template
- Known-good-state archive

## Recovery promise

Jetson-C does not need to be powerful. It needs to be there.

If Jetson-A is blank, broken, or mid-rebuild, Jetson-C should still be able to answer:

> What do we do next?

## What not to store

Do not store raw secrets here unless the machine is treated as a secured secrets host. Prefer:

- placeholder files
- `.env.example`
- redacted snapshots
- instructions for where secrets are kept
