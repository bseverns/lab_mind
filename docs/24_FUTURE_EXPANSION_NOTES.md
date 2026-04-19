# 24 — Future Expansion Notes

## Possible later additions

Only add after the base stack is boring.

- Home Assistant view for room status
- Uptime Kuma for nicer checks
- MQTT-based printer/CNC status events
- small custom Digital Factory API bridge
- local camera snapshots for non-printer machines
- classHub helper integration over private network
- automated known-good snapshot after successful class day
- weekly incident summary generation

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
