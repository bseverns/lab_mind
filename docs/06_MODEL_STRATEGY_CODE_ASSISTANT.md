# 06 - Model Strategy for the Code Assistant

Jetson-A is the only node that should carry local model serving.
The older Jetson Nanos are not model hosts for this architecture.

The reason is practical, not romantic:

- the Orin has the best chance of keeping the assistant responsive
- the Nanos have too little headroom for large-model inference
- distributed inference across tiny edge nodes creates failure modes that are harder to explain and harder to recover

## Feasible model classes on Jetson-A

Use placeholders until the final tested values are known.

| Mode | Typical size class | Purpose | Operational shape |
|---|---|---|---|
| fast model | small, low-latency | short answers, navigation, summaries, educator prompts | should feel quick |
| code model | mid-size quantized | repo help, code edits, runbook guidance, structured explanations | slower but useful |
| heavy model | larger quantized local model | deeper synthesis when the room can afford it | only if Jetson-A stays usable |

## Storage reality

The attached 250 GB SSD gives Jetson-A room for model files, cache, and working data.

Use that space for:

- one fast model
- one code model
- optionally one heavier model if it still fits comfortably

Do not treat the SSD as permission to mirror the cloud.
It is a local assistant store, not a model zoo.

## Fast-model mode

Fast mode is the default when the operator wants the room to stay snappy.

Use it for:

- quick assistant replies
- simple docs lookup
- lightweight summarization
- browser-first classroom help

## Heavy-model mode

Heavy mode is allowed only when the operator accepts the tradeoff.

Use it for:

- longer synthesis
- code review assistance
- multi-step reasoning where latency is acceptable

Heavy mode should not make Jetson-A feel like it is pinned to the wall.

## Why the Nanos are not for large models

The Jetson Nanos are fine for:

- room status
- service polling
- local dashboards
- bridge tasks

They are not good places for large models because:

- memory is tight
- storage is usually modest
- thermal headroom is smaller
- the architecture becomes harder to explain
- a recovery path gets ugly very quickly

## Better code results without breaking the architecture

If the local 3B code model is not enough, the R900 can host a separate backend for a larger code model.

That is allowed because it is a separate backend, not a distributed model.
Jetson-A still stays the browser-facing assistant node.

## Controlled cooperation for code workflows

There is one narrow exception to the usual "keep each node simple" rule:

- Jetson-A may route code-assistant requests to the R900 over the private network
- the R900 may host the heavier code backend
- Headscale may be used to carry that private path when the operator is off-site

This is cooperation at the service boundary, not cooperation at the model boundary.

Keep these rules in place:

- do not split one model across machines
- do not shard inference across the Nanos
- do not make the R900 the browser front door
- do not expose the backend publicly

The benefit is practical: the code assistant can be slower and better when that is the right tradeoff, while the operator still sees one simple assistant entry point.

Use the R900 option when:

- better code reasoning matters more than speed
- the R900 RAM gives you more room
- you want to keep the assistant experience on Jetson-A but move the compute elsewhere

See:

- `docs/26_R900_REMOTE_CODE_BACKEND.md`
- `docs/27_COOPERATIVE_CODE_MODE.md`
- `compose/r900-code.compose.yml`
- `compose/jetson-a-remote-code.compose.yml`

## Operational split

1. Keep the assistant model on Jetson-A.
2. Keep the Nanos on support jobs.
3. Keep the R900 as the archive and service spine.
4. Edit placeholders until a model is actually tested.

## Editing values

Use:

- `ops/lab/model-values.example`
- `templates/MODEL_SHORTLIST.example.md`
- `templates/MODEL_CANDIDATES.example.csv`
- `templates/LOCAL_MODEL_STACK.example.yml`
- `templates/MODEL_TEST_LOG.csv`

If you want a local model stack template, start from:

- `compose/jetson-a-llamacpp.compose.yml`

If you want to build the stack in pieces, use:

- `compose/jetson-a-base.compose.yml`
- `compose/jetson-a-fast.compose.yml`
- `compose/jetson-a-code.compose.yml`
- `compose/jetson-a-heavy.compose.yml`
- `compose/r900-code.compose.yml`
- `compose/jetson-a-remote-code.compose.yml`

Then follow:

- `docs/25_JETSON_A_MODEL_BUILD_PIECES.md`
- `docs/26_R900_REMOTE_CODE_BACKEND.md`
- `docs/27_COOPERATIVE_CODE_MODE.md`

Do not write final claims into the docs until the model has been tested in the room.

## Signs the model is too big

- the cockpit feels sticky
- browser interaction becomes laggy
- thermal pressure rises
- responses degrade enough that the assistant is no longer better than the docs mirror

## Rule

If the model is too slow, shrink the model.
Do not compensate by spreading inference around the room.
