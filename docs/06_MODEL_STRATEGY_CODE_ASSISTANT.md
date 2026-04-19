# 06 — Model Strategy: Code Assistant

## Goal

Run the largest useful local code-assistant model on Jetson-A without making the room wait forever.

## Practical ceiling

Jetson-A is the only reasonable model host. The older Jetson Nanos should not participate in distributed inference.

Target model class:

- 6B–7B code model
- 4-bit quantized
- conservative context window
- small output budget by default

## Recommended test order

| Order | Model class | Why |
|---:|---|---|
| 1 | 3B–4B general instruct | fast daily helper |
| 2 | Qwen2.5-Coder 7B quantized | first serious code model candidate |
| 3 | DeepSeek-Coder 6.7B quantized | alternate code candidate |
| 4 | CodeLlama 7B quantized | known baseline |
| 5 | StarCoder2 7B quantized | alternate baseline |

Record real results in:

- `templates/MODEL_TEST_LOG.csv`

## Two-gear policy

Use two model modes:

### Fast mode
For:

- checklist questions
- log summaries
- “what do I check next?”
- short bash commands
- intern help

### Code mode
For:

- script review
- Docker Compose edits
- Python/bash generation
- explaining stack traces
- writing setup automation

## Suggested defaults

| Setting | Fast mode | Code mode |
|---|---:|---:|
| context | 2048–4096 | 4096–8192 if tolerable |
| max output | 256–512 | 512–1024 |
| temperature | 0.2–0.4 | 0.1–0.3 |
| concurrency | 1 | 1 |

## Evaluation tasks

A model is useful only if it helps with real room work.

Test prompts:

1. Explain a Docker Compose error from a copied log.
2. Write a bash check that verifies NVMe mount and Docker health.
3. Summarize a Digital Factory missing-printer incident.
4. Patch a Node-RED flow note into a safer checklist.
5. Explain why not to expose Portainer publicly.
6. Produce an intern-safe recovery sequence.

## Pass/fail

Pass means:

- answers within an acceptable time
- does not invent device details
- asks for exact error text when needed
- keeps safety boundaries clear
- produces commands a human can inspect

Fail means:

- too slow to be used during class
- hallucinates local hostnames or secrets
- gives unsafe CNC or network advice
- outputs giant command blobs with no explanation

## Important note

The most useful model may not be the largest one. A slightly smaller model that responds quickly may beat a larger model that feels like it is composing scripture under a blanket.
