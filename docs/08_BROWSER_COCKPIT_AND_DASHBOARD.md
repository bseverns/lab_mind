# 08 - Browser Cockpit and Dashboard

The operator experience should begin in a browser and stay in a browser.
Do not make the room depend on a remote desktop when a simple internal page will do.

## The cockpit promise

One screen should answer:

- is the spine up
- is the assistant up
- are the printers visible
- are the edge nodes alive
- is the docs mirror available
- is CNCjs enabled, if the machine path exists

## Recommended tiles

Use a boring, explicit order:

1. Open WebUI
2. R900 internal site
3. Portainer
4. Node-RED
5. Syncthing
6. Digital Factory
7. local docs mirror
8. CNCjs only if enabled and physically appropriate

## What the cockpit is not

Do not turn the cockpit into:

- a wall of nested menus
- a status page with hidden meaning
- a remote desktop launcher
- a control panel for secret values

The cockpit should read like a map, not a puzzle.

## One-screen rule

If a beginner is standing at the tablet or lab browser, they should be able to:

- open the assistant
- open the docs
- check printer status
- open operator tools
- stop before they touch unsafe controls

## Good implementation targets

- `dashboard/index.html`
- `handoff/DASHBOARD_BOOKMARKS.html`
- the R900 internal site

Keep public/cloud traffic separate from this page.
