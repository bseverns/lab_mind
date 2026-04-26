# 25 - Jetson-A Model Build Pieces

This page is for a slow, safe build.
Do not try to build the full assistant stack in one jump if you can avoid it.

## The build pieces

1. Base UI only
2. Fast model profile
3. Code model profile
4. Heavy model profile
5. Optional remote code backend on the R900

The profiles are meant to be used one at a time on Jetson-A.

## Piece 1: Base UI

Bring up the assistant shell first:

```bash
docker compose -f compose/jetson-a-base.compose.yml up -d
```

What should work:

- cockpit page
- Open WebUI shell
- browser access to the assistant UI

What should not be expected yet:

- a working model backend
- strong answers
- any fancy model behavior

## Piece 2: Fast model

When the base UI is stable, add the fast profile:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-fast.compose.yml up -d
```

Use this when you need:

- quick chat
- short summaries
- educator prompts
- first-pass help

See also:

- `handoff/MODEL_SWITCH_CARD.md`

Suggested model class:

- Qwen2.5-1.5B-Instruct
- Llama 3.2 1B Instruct
- Gemma 2 2B IT

## Piece 3: Code model

If the fast model works, test a code-focused profile:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-code.compose.yml up -d
```

Use this when you need:

- repo help
- code edits
- scripts
- runbook guidance

See also:

- `handoff/MODEL_SWITCH_CARD.md`

Suggested model class:

- Qwen2.5-Coder-3B-Instruct

## Piece 4: Heavy model

Only add the heavy profile if Jetson-A still feels comfortable:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-heavy.compose.yml up -d
```

Use this when you need:

- deeper synthesis
- longer reasoning
- more complex code help

See also:

- `handoff/MODEL_SWITCH_CARD.md`

Suggested model class:

- Qwen2.5-7B-Instruct
- Gemma 2 9B IT

## Piece 5: Optional remote code backend

If you want better code results and can tolerate more latency, move the code model backend to the R900.

Start the R900 backend:

```bash
docker compose -f compose/r900-code.compose.yml up -d
```

Then point Jetson-A at it:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-remote-code.compose.yml up -d
```

Suggested model class:

- Qwen2.5-Coder-7B-Instruct GGUF

Use this when:

- the local 3B code model is not good enough
- the room can tolerate slower replies
- the operator wants better code reasoning

See also:

- `handoff/MODEL_CHOICE_LADDER.md`

## Storage layout

Keep the SSD easy to understand:

- `/srv/labbrain/models/fast`
- `/srv/labbrain/models/code`
- `/srv/labbrain/models/heavy`
- `/srv/labbrain/models/remote-code`
- `/srv/labbrain/data/openwebui`
- `/srv/labbrain/data/llamacpp`

## What to record

For each piece, record:

- exact compose file pair used
- model file path
- context size
- GPU layer setting
- time to first token
- whether the assistant stayed responsive

Use:

- `templates/MODEL_TEST_LOG.csv`
- `templates/MODEL_CANDIDATES.example.csv`

## Stop rule

If the room gets sluggish, stop adding pieces.
Do not solve slowness by adding more model layers.
