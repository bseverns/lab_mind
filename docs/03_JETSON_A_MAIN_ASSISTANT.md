# 03 - Jetson-A Main Assistant

Jetson-A is the live local assistant node.
It is the place where a person should be able to open a browser and get help without thinking about the rest of the room.

## What belongs here

- Open WebUI
- local model serving
- code-assistant workflows
- local docs and RAG
- browser-first educator access
- small private helper services needed by the assistant experience
- optional CNCjs if the machine is physically adjacent and the safety path is documented

## What does not belong here

- the known-good archive
- shared storage as the primary source of truth
- monitoring as the only place the room can be observed
- public dashboards
- distributed inference across the Nanos
- any service that would make Jetson-A impossible to rebuild cleanly

## Operating assumptions

1. Jetson-A is the only node that should feel interactive and intelligent.
2. Jetson-A should be reachable through Headscale for trusted users, not publicly exposed.
3. Jetson-A can fail without taking the rest of the room down.

## Service sketch

| Service | Expected path | Notes |
|---|---|---|
| Open WebUI | `http://jetson-a.lab.internal:3000` | assistant surface |
| Model server | `http://jetson-a.lab.internal` | local only |
| Local docs/RAG | `http://jetson-a.lab.internal/docs` | browser-first retrieval |
| Private educator path | Headscale tailnet | not public |
| CNCjs | `EDIT_ME` | only if physically appropriate |

## Good habits

- keep model choices in `ops/lab/model-values.example`
- keep URLs in `ops/lab/service-urls.example`
- keep hostnames in `ops/lab/hostnames.example`
- log model tests in `templates/MODEL_TEST_LOG.csv`
- assume the R900 is the archive and recovery home

## Recovery note

If Jetson-A is down, the room should still have:

- the R900 docs mirror
- the inventory templates
- the known-good-state archive
- the browser path to explain what should be rebuilt
