# Experimental Surfaces

This page lists the parts of the architecture that are allowed to exist, but are not yet considered boring or locked.

## Explicitly experimental

| Surface | Status | Notes |
|---|---|---|
| R900 remote code backend | experimental | keep private, benchmark before trusting |
| Heavy Jetson-A model mode | experimental | only if Jetson-A stays responsive |
| Node-RED / MQTT flows | optional | only if a real room problem exists |
| CNCjs path | optional | only when physically appropriate |
| Future VLAN separation | future optional | only if the room needs it |

## What belongs here

- things that may help
- things that still need evidence
- things that are not yet part of the stable operating path

## What does not belong here

- backups
- the docs mirror
- the recovery archive
- the core assistant path
- the core internal cockpit

## Rule

If a surface is still being tested, label it as such.
Do not let a temporary convenience become a hidden dependency.
