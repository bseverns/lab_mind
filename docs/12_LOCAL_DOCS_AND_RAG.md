# 12 — Local Docs and RAG

## Purpose

The assistant becomes useful when it knows the room.

The local docs collection should include:

- lab-brain docs
- printer setup/checklists
- Cubiko workflow
- Digital Factory notes
- Headscale placeholder values without secrets
- known-good-state snapshots
- incident summaries
- classHub docs, if relevant to local support
- selected scripts and Compose files

## RAG rule

Do not ingest secrets.

Prefer:

- `.env.example`
- redacted configs
- READMEs
- checklists
- markdown notes
- incident summaries

Avoid:

- API keys
- preauth keys
- raw student data
- private staff notes
- cloud credentials

## Collection names

Suggested Open WebUI collections:

| Collection | Contents |
|---|---|
| `lab-brain-ops` | these docs and checklists |
| `manufacturing-systems` | printers, Digital Factory, CNC |
| `classhub-reference` | classHub public/operator docs, if used |
| `known-good-states` | redacted snapshots and system state notes |
| `incidents` | incident summaries, not raw secrets |

## Update cadence

- update docs collection after major doc changes
- summarize incidents before ingestion
- re-index known-good-state after successful rebuilds
- delete stale docs rather than letting the model learn ghosts
