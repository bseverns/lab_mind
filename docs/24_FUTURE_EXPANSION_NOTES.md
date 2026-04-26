# 24 - Future Expansion Notes

Only add more pieces after the base stack is boring.

## Possible later additions

- Home Assistant view for room status
- nicer monitoring front ends
- MQTT-based printer or CNC status events
- a small custom Digital Factory bridge
- local camera snapshots for non-printer machines
- classHub helper integration over the private network
- automated known-good snapshot after a successful class day
- weekly incident summary generation
- optional future VLAN separation if the room actually needs it

## Avoid until necessary

- Kubernetes
- distributed inference
- public dashboards
- full surveillance wall
- complicated identity stack beyond the actual need
- auto-controlling machines without human review

## Expansion test

Before adding a feature, ask:

1. Does this reduce operator load?
2. Does this improve safety or recovery?
3. Can an intern understand it?
4. Can it fail without taking down class?
5. Is there a delete path?

If not, it is probably decoration wearing a tool belt.
