# 13 — Incident Recorder

## Purpose

The lab-brain should turn problems into future knowledge.

Every weird failure is a small unpaid teacher. Capture the lesson.

## Minimum incident fields

Use `templates/INCIDENT_LOG.csv`.

Fields:

- date
- time
- reporter
- node or machine
- what they were trying to do
- what happened
- exact error text
- screenshot/photo path
- what was tried
- result
- follow-up needed

## Incident levels

| Level | Meaning |
|---|---|
| Note | interesting but harmless |
| Degraded | class can continue with workaround |
| Blocking | class/work cannot continue |
| Safety | physical or data safety concern |

## Assistant use

Ask the assistant to summarize incidents into:

- symptom
- likely cause
- fix attempted
- final fix
- doc update needed

Do not ingest raw sensitive data.
