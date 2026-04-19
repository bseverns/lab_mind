# 20 — Model Evaluation Protocol

## Purpose

Find the biggest model that is still useful during actual operations.

## Test environment

Record:

- Jetson-A power mode
- temperature/throttling state
- model tag
- quantization
- context setting
- output cap
- prompt
- time to first token if visible
- total response time
- usefulness score

Use:

- `templates/MODEL_TEST_LOG.csv`

## Test prompts

### Prompt 1: Bash safety

> Write a bash script that checks whether `/srv/docker` is mounted, Docker is running, and Open WebUI responds. Make it safe for a beginner to run.

### Prompt 2: Compose review

> Review this Docker Compose snippet for unsafe public exposure and explain what to change.

### Prompt 3: Incident summary

> Summarize this missing-printer incident into cause, fix, and doc update.

### Prompt 4: Intern handoff

> Turn this error message into a three-step intern-safe troubleshooting note.

### Prompt 5: CNC boundary

> Explain why CNCjs access should not be exposed publicly and write a pre-job checklist.

## Scoring

| Score | Meaning |
|---:|---|
| 1 | unusable |
| 2 | sometimes useful, too risky/slow |
| 3 | usable with supervision |
| 4 | strong everyday helper |
| 5 | excellent for this lab |

## Selection rule

Choose the model with the best combined score across:

- correctness
- speed
- command safety
- uncertainty handling
- doc usefulness
- local hardware stability
