# Board Case for the Infrastructure Spine

This page is written for a board-level conversation.
It stays simple on purpose.

## What the lab is now

The room is a mixed-hardware lab with:

- one Dell PowerEdge R900 as the infrastructure spine
- one Jetson Orin Nano as the live assistant node
- two Jetson Nanos as edge/support nodes
- a fleet of Raspberry Pis as replaceable edge appliances
- an Ethernet switch as the containment layer
- Headscale for private access
- Digital Factory for printer truth
- optional Cubiko/CNC integration when the machine path is real

## What the spine currently has to do

The R900 is expected to carry the boring services that make the room recoverable:

- backups
- shared storage
- monitoring
- dashboards
- Portainer
- docs mirror
- known-good-state archive
- internal operational memory

## What fails if the spine is weak

If the server spine is fragile, the room becomes harder to rebuild after:

- an accidental change
- a node replacement
- a model update
- a storage failure
- a printer or CNC integration failure

That is why the repo keeps a separate current state layer, tested values, and known-good snapshots.

## Why a modern central server would help

A new or upgraded central server/workstation would reduce risk by giving the lab:

- more predictable storage behavior
- easier restore workflows
- simpler backup scheduling
- better room-wide observability
- more room for local docs and archival copies

## What it would not solve by itself

A server does not replace:

- the assistant node at the browser front door
- the edge nodes doing room chores
- the switch and cable discipline
- the need for tested values and recovery notes

## Budget tiers

See `templates/BOARD_BUDGET_TIERS.example.md` for a simple three-tier framing.

## Rule

The point of infrastructure spending is not novelty.
It is to make the room easier to explain, easier to restore, and less likely to surprise the people who have to operate it.
