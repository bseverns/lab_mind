# 13 - Incident Recorder

The lab should turn problems into future knowledge.
Every weird failure is a small unpaid teacher. Capture the lesson.

## Minimum incident fields

Use `templates/INCIDENT_LOG.csv`.

Fields:

- date
- time
- reporter
- level
- node or machine
- what they were trying to do
- what happened
- exact error text
- screenshot or photo path
- what was tried
- result
- follow-up needed

## Incident levels

| Level | Meaning |
|---|---|
| Note | interesting but harmless |
| Degraded | class can continue with workaround |
| Blocking | class or work cannot continue |
| Safety | physical or data safety concern |

## Good incident behavior

- write the exact error text
- capture the photo or screenshot path
- say what changed before the failure
- say what fixed it, if anything
- say whether the fix should become a doc update

## Assistant use

Ask the assistant to summarize incidents into:

- symptom
- likely cause
- fix attempted
- final fix
- doc update needed

Do not ingest raw sensitive data.
