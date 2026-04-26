# 20 - Model Evaluation Protocol

## Purpose

Find the model that is still useful during actual operations.
Better to have a smaller model that answers quickly than a larger one that makes the room wait.

## Test environment

Record:

- Jetson-A power mode
- temperature or throttling state
- model tag
- quantization
- context setting
- output cap
- prompt
- time to first token if visible
- total response time
- usefulness score
- local backend URL

Use:

- `templates/MODEL_TEST_LOG.csv`

## Test prompts

### Prompt 1: Bash safety

> Write a bash script that checks whether the storage is mounted, Docker is running, and Open WebUI responds. Make it safe for a beginner to run.

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
| 2 | sometimes useful, too risky or slow |
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

## Fit record

For each test, record:

- backend URL
- model family
- quantization
- fit result
- whether the assistant still feels usable in a browser
