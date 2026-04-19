# 08 — Browser Cockpit and Dashboard

## Purpose

The cockpit is the first page an educator or intern opens.

It should answer:

- What is this system?
- What is ready?
- What is broken?
- Where do I click next?

## Recommended cockpit sections

1. **Today’s status**
2. **Assistant**
3. **Manufacturing systems**
4. **Docs and checklists**
5. **Recovery and incident logging**
6. **Admin-only tools**

## Pinned tabs

On the spare tablet or lab browser:

1. Cockpit landing page
2. Open WebUI
3. Digital Factory
4. Portainer
5. Node-RED
6. Docs mirror
7. CNCjs only if physically appropriate

## Dashboard files in this bundle

- `dashboard/index.html`
- `dashboard/status-example.json`
- `scripts/make_static_dashboard.py`

These are intentionally simple. The dashboard should be boring enough that it can be fixed while tired.

## Status language

Use plain labels:

- Ready
- Degraded
- Missing
- Offline
- Unknown
- Do not use

Avoid clever names. Cleverness is delightful until a substitute teacher has to debug it.
