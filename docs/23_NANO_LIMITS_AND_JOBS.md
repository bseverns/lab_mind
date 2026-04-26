# 23 - Jetson Nano Limits and Jobs

The Jetson Nanos are support nodes, not assistant nodes.
They are useful when they stay small.

## What they are good at

- room status
- health checks
- lightweight status dashboards
- simple bridge tasks
- simple camera or sensor jobs
- machine-adjacent helper duties

## What they are not good at

- large local code models
- distributed LLM inference for this room
- heavy embeddings over huge corpora
- being reliable high-load server boxes
- becoming the only copy of anything important

## Rule

Use the Nanos to make the lab more reliable, not more theatrical.

## Good Nano jobs

Jetson-B:

- check every service
- publish status
- send alerts
- hold simple flows

Jetson-C:

- host local dashboard panels
- keep machine-adjacent helper views alive
- mirror lightweight status if needed

## Bad Nano jobs

- part of the big-brain model cluster
- extra copy of every service
- remote CNC controller from across the room
- secret storage without a security plan
