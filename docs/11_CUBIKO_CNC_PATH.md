# 11 — Cubiko CNC Path

## Purpose

The Cubiko may be connected to Jetson-A or another nearby node through USB and controlled with CNCjs.

The controlling node should be physically close to the CNC.

## Safety boundary

The dashboard is not safety.
CNCjs is not supervision.
A checklist is not judgment.

The system may remind; humans decide.

## Before enabling CNCjs

Confirm:

- physical placement
- USB stability
- power path
- emergency stop / stop procedure
- dust and debris control
- adult supervision policy
- material hold-down method
- who is allowed to send jobs

## Pre-job checklist

Use:

- `templates/CNC_PREJOB_CHECKLIST.md`

## Default access

CNCjs should be private only:

- LAN and/or tailnet
- no public exposure
- no student device access by default

## Success signal

- CNCjs loads
- controller connects
- status visible
- jog/test movement works under supervision
- safety checklist exists beside the interface
- no one mistakes remote access for remote machining permission
