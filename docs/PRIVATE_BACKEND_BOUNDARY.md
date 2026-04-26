# Private Backend Boundary

This page defines the line between private control traffic and public/browser traffic.

## Allowed private paths

- Jetson-A compose-local access to its own llama.cpp backend
- Jetson-A to R900 code backend over the private network
- Headscale-managed remote operator access
- internal docs mirror
- spine management tools

## Not allowed as public defaults

- code backends
- published model backends
- Portainer
- Node-RED
- model serving
- machine controllers
- internal only status dashboards

## Rules

- If a service controls machines or serves models, keep it private unless there is a strong reason not to.
- If a browser can reach it directly, make that decision explicit in the docs.
- Do not widen the boundary just because it is nearby.
- The Jetson-A local model backend should stay inside compose unless the docs explicitly say otherwise.
- The R900 code backend may be reachable only through the private access layer.

## Recovery note

The boundary should be simple enough that an intern can explain it back correctly after reading this page once.
