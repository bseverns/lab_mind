# Model Choice Ladder

Use this when you want the simplest answer to "which Jetson-A profile should I start?"

This is about model size and usefulness.
If you are deciding where the backend runs, use the code toggle checklist instead.

## Ladder

1. Fast
2. Code
3. Heavy
4. Cooperative R900 code mode, if the code path needs a stronger backend

## Step 1: Fast

Choose fast first when:

- the question is short
- the user wants a quick answer
- you are helping a beginner
- you want to keep the room responsive

Fast command:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-fast.compose.yml up -d
```

## Step 2: Code

Choose code when:

- the task involves scripts
- the task involves repo help
- the task needs structured explanation
- the fast model is too shallow

Code command:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-code.compose.yml up -d
```

## Step 3: Heavy

Choose heavy when:

- code is still not enough
- deeper synthesis matters
- Jetson-A still feels responsive
- you accept slower responses

Heavy command:

```bash
docker compose -f compose/jetson-a-base.compose.yml -f compose/jetson-a-heavy.compose.yml up -d
```

## Step 4: Cooperative R900 code mode

Choose the R900 code backend when:

- the code profile is not good enough
- better reasoning matters more than latency
- the room can tolerate slower responses
- you want one browser front door but a stronger backend

Use:

- `OPERATOR_TOGGLE_CHECKLIST.md`
- `docs/27_COOPERATIVE_CODE_MODE.md`

## If you are unsure

Default to fast.
The room can still be useful when the model is small.
The wrong large model is worse than a good small one.

## What to log

After changing the profile, write down:

- date and time
- old profile
- new profile
- model file path
- context size
- whether the change helped

Use:

- `templates/MODEL_TEST_LOG.csv`
