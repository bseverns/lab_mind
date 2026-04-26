# 04 - Jetson Nano Edge Support Nodes

Jetson-B and Jetson-C are the support Nanos.
They should be treated as replaceable edge appliances, not miniature servers with heroic expectations.

## What they watch

- whether the room is up
- whether the main services are responding
- whether a machine-adjacent helper is behaving
- whether the current dashboard still reflects reality

## What belongs on these nodes

- room status panels
- lightweight service polling
- local dashboards
- machine-adjacent helper roles
- simple sensor or bridge tasks

If a task needs long retention, heavy storage, or a serious model, it does not belong here.

## What does not belong here

- the main assistant
- the known-good archive
- the docs mirror
- the primary model server
- central automation if the R900 can host it more cleanly

## Good output

The Nanos should help answer:

- Is the room alive?
- Which machine needs attention?
- Is the browser cockpit still pointing at valid services?
- Is the printer or CNC side behaving as expected?

## Practical rule

If the node would be annoying to rebuild from scratch, the job is probably too important for a Nano.
