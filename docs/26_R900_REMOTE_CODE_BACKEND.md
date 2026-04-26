# 26 - R900 Remote Code Backend

The R900 can host a larger code model for times when better answers matter more than speed.

This is not distributed inference.
It is a separate backend that Jetson-A can talk to over the network.
If you want to think about it as a "Headscale-style cooperation," that is the right mental model:
private, authenticated, narrow, and limited to this one code path.

## When to use it

Use the R900-backed code agent when:

- the local Jetson-A code model is too small
- you want better code reasoning
- the room can tolerate more latency
- you still want the assistant browser experience to stay on Jetson-A

## What to run on the R900

Start the backend:

```bash
docker compose -f compose/r900-code.compose.yml up -d
```

Expected shape:

- `llama.cpp` server on the R900
- port `8081` exposed only on the local network or private control path
- the model lives on the R900 storage, not on Jetson-A

## What to run on Jetson-A

Point Open WebUI at the R900 backend:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-remote-code.compose.yml up -d
```

That keeps the browser assistant on Jetson-A while the model compute sits on the spine.

## Suggested model class

- Qwen2.5-Coder-7B-Instruct GGUF

Start with a quantization that fits cleanly and only move up if the R900 stays comfortable.

## Rules

- Do not split one model across machines.
- Do not let the R900 become the primary assistant surface.
- Do not expose the backend publicly.
- Keep the Jetson-A browser path as the operator front door.
- Use Headscale only as the private reachability layer, not as a reason to widen the architecture.

See also:

- `docs/27_COOPERATIVE_CODE_MODE.md`
