# 27 - Cooperative Code Mode

This is the operator-facing note for the one narrow exception in the lab architecture:
Jetson-A may cooperate with the R900 for code assistance while still presenting one browser-first assistant surface.

This is allowed because it is a private service split, not a split model.
Do not turn it into a general-purpose distributed system.

## What this mode is

- Jetson-A stays the user-facing assistant node
- the R900 hosts the optional heavier code backend
- Headscale may carry the private path when the operator is off-site
- the operator still sees one assistant entry point in the browser

## What this mode is not

- distributed inference
- model sharding across the room
- a way to involve the Jetson Nanos in model work
- a reason to expose the backend publicly
- a replacement for the local Jetson-A model path

## Switch points

Use the local Jetson-A code path when:

- the model is fast enough
- the room should stay simple
- you are doing ordinary repo help or light code edits
- you want the least moving parts

Switch to cooperative R900 code mode when:

- the local code model is not good enough
- better reasoning matters more than latency
- the R900 has the RAM headroom to stay comfortable
- you want to preserve the Jetson-A front door but move compute elsewhere

Switch back to local Jetson-A code mode when:

- the R900 backend is unavailable
- the network path is unreliable
- the room feels sluggish
- the larger backend is not buying enough quality to justify the delay

## Exact operator actions

Local mode:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-code.compose.yml up -d
```

Cooperative mode:

```bash
docker compose -f compose/r900-code.compose.yml up -d
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-remote-code.compose.yml up -d
```

Fallback to local after testing:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-code.compose.yml up -d
```

## Suggested division of labor

Local Jetson-A code mode:

- quick iteration
- smaller models
- lower latency
- routine assistant work

Cooperative R900 code mode:

- heavier code reasoning
- slower but better answers
- more room for larger quantized models
- tasks where correctness matters more than immediate speed

## Recovery rule

If the cooperative mode becomes annoying or fragile, disable it.
The lab should still be useful with only the local Jetson-A path.

If the local path is healthy and good enough, keep using it.
The larger backend is an option, not a requirement.
