# 15 — Privacy and Safety Boundary

## Purpose

The lab-brain should make the room more capable without quietly turning into surveillance or unsafe automation.

## Defaults

- local-first where practical
- no raw secrets in docs/RAG
- no student data in model context by default
- no public exposure of private tools
- no remote CNC operation without explicit human policy
- no hidden camera scraping
- no prompt logging unless deliberately time-boxed for debugging

## What the assistant can know

Good:

- setup docs
- public machine manuals
- printer inventory
- checklists
- scripts
- redacted incident summaries
- known-good-state notes

Bad:

- passwords
- API keys
- private student records
- staff HR details
- unredacted personal data
- surveillance-style camera logs

## Student-facing explanation

A good simple explanation:

> This is a local helper for the lab. It can read the lab’s setup notes and help us troubleshoot. It is not a person, not a teacher, and not a place to put private information.

## CNC safety line

The system may show reminders and status.
Only humans supervise machining.
