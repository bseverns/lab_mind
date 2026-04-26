# Model Switch Card: Fast, Code, Heavy

Use this card when deciding which Jetson-A model profile should be active.

This is about model size and speed, not about where the backend runs.
For backend location, use the code toggle checklist.

## Default

Start with the fast profile unless you have a reason to go bigger.

Fast means:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-fast.compose.yml up -d
```

## Use fast when

- you want quick replies
- you are helping a student or educator
- the task is simple lookup or summarization
- you want the least latency and the least risk

## Switch to code when

- you are working on repo help
- you need code edits or structured explanation
- the fast model is too shallow
- you want better code assistance without jumping to the heaviest profile

Code means:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-code.compose.yml up -d
```

## Switch to heavy when

- the code profile is not enough
- you can tolerate slower replies
- Jetson-A still feels responsive
- you want deeper synthesis or more complex reasoning

Heavy means:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-heavy.compose.yml up -d
```

## Do not switch up when

- the room is already sluggish
- the assistant is doing routine help well enough
- you are in the middle of a physical task
- you would be guessing at a model path or file name

## What to record

After a profile change, write down:

- date and time
- old profile
- new profile
- exact compose files used
- model file path
- context size
- whether Jetson-A stayed responsive
- whether the profile change was worth it

Use:

- `templates/MODEL_TEST_LOG.csv`

## Recovery rule

If the heavier profile makes Jetson-A feel sticky, step back down.
Fast is always allowed.
Code is the normal working profile.
Heavy is only for cases where the extra latency buys something real.
