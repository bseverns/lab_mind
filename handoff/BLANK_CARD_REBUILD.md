# Blank Card Rebuild

Use this when the assistant node or a helper node needs to be rebuilt from scratch.

## First rule

Do not start by guessing.
Start by finding the R900 docs mirror and the inventory templates.

## Rebuild order

1. Confirm the spine still exists.
2. Confirm the storage and docs mirror are reachable.
3. Reimage or repair Jetson-A if needed.
4. Restore Open WebUI and model serving.
5. Restore the cockpit page.
6. Restore edge nodes only after the assistant is stable.
7. Reintroduce Headscale access only after local access works.
8. Recheck Digital Factory and printer inventory.
9. Only then consider CNCjs if the machine path is real.

## What to collect before touching anything

- exact hostname
- exact node role
- exact error text
- photos of the current screen
- current inventory row
- current service URL placeholder

## What good looks like

- R900 opens first
- Jetson-A opens second
- the cockpit is simple
- the docs mirror is readable
- the room can be explained to a substitute operator
