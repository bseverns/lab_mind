# Operator Toggle Checklist: Local vs Cooperative Code Mode

Use this when deciding whether Jetson-A should keep the code assistant local or hand code requests to the R900 backend.

This is a one-way operational choice at the service boundary.
It is not a distributed model.

## Default

Start local unless there is a reason not to.

Local means:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-code.compose.yml up -d
```

## Stay local when

- the code replies are good enough
- the room should stay simple
- latency matters more than deeper reasoning
- the R900 is busy with storage, backups, or recovery work
- you are rebuilding after an outage and want the smallest moving part

## Switch to cooperative R900 mode when

- local code quality is not good enough
- the request is hard enough that slower answers are acceptable
- the R900 has memory headroom
- the private network path is healthy
- you want one assistant front door with a stronger backend behind it

Cooperative mode means:

```bash
docker compose -f compose/r900-code.compose.yml up -d
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-remote-code.compose.yml up -d
```

## Do not switch when

- the network is unstable
- the R900 is already overloaded
- the assistant is being used for quick, routine help
- you would need to invent hostnames or URLs to make it work
- the lab is in the middle of a physical safety task

## What to record after switching

Write down:

- date and time
- which mode is active
- exact compose files used
- model name and file path
- context size
- whether Headscale was involved
- whether the assistant stayed responsive
- whether the quality gain was worth the delay

Use the model test log:

- `templates/MODEL_TEST_LOG.csv`

## Fallback

If cooperative mode is worse than expected, fall back immediately:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-code.compose.yml up -d
```

If both modes feel bad, stop and check the room before changing anything else.

## Recovery rule

The lab should remain useful even if only the local Jetson-A code mode is available.
The R900 backend is an upgrade path, not a dependency.
