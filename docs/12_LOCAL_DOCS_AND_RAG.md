# 12 - Local Docs and RAG

The assistant becomes useful when it knows the room.
Jetson-A should read the docs mirror, not the public internet, for most operational questions.

## What belongs in the local collection

- the lab docs
- printer setup and checklists
- Cubiko workflow notes
- Digital Factory notes
- Headscale placeholder values without secrets
- known-good-state snapshots
- incident summaries
- selected scripts and Compose files

## What does not belong in the local collection

- API keys
- preauth keys
- raw student data
- private staff notes
- cloud credentials
- anything that would make the archive hard to share or recover safely

## Suggested collections

| Collection | Contents |
|---|---|
| `lab-ops` | these docs and checklists |
| `manufacturing-systems` | printers, Digital Factory, CNC |
| `known-good-states` | redacted snapshots and system state notes |
| `incidents` | incident summaries, not raw secrets |
| `model-notes` | tested model settings and prompt notes |

## Update cadence

- update the collection after major doc changes
- summarize incidents before ingestion
- re-index known-good-state after a successful rebuild
- delete stale docs rather than letting the model learn ghosts

## Boundary

R900 is the best home for the docs mirror and archive.
Jetson-A is the best home for the interactive retrieval experience.
