# 11 - Cubiko CNC Path

Cubiko or any CNC path is optional.
If it exists, it must remain physically local, clearly documented, and easy to disable.

## Safety boundary

The dashboard is not safety.
CNCjs is not supervision.
A checklist is not judgment.

Only humans decide whether a job can run.

## Before enabling CNCjs

Confirm:

- physical placement
- USB stability
- power path
- emergency stop and stop procedure
- dust and debris control
- adult supervision policy
- material hold-down method
- who is allowed to send jobs

## Where it can live

Put CNCjs only on a node that is physically appropriate for the machine.
That may be Jetson-A if the machine is nearby, or a nearby Pi if the controller path is simple.

Never assume the R900 should control the CNC by default.

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
