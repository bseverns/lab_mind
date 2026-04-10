# Digital Factory Setup

## Summary
Digital Factory is the browser-side pane for the MakerBot / UltiMaker fleet.
Do not try to make the Jetson replace it.

## Login bookmark
Use the placeholder bookmark in:
- `ops/jetson/bookmarks/lab_brain_bookmarks.html`

Update the URL and workspace name before handoff.

## Expected fleet
At the time this docs bundle was generated, expected office fleet was:

- 3 Sketch printers
- 2 Sketch+ printers
- 1 Method X

Update this file if the fleet changes.

## First login flow
1. open Digital Factory in the browser
2. sign in with the org-approved account
3. confirm the correct workspace
4. confirm the expected printers appear
5. record missing printers before changing anything else

## Availability check
A calm first check is:
- all expected printers are visible
- names make sense
- state/status is visible
- no device is unexpectedly missing
- webcam or snapshot surfaces, if available in the UI, are visible enough for quick checks

## What belongs here
Use Digital Factory for:
- printer visibility
- queue awareness
- remote cloud-side management
- browser-based observation

## What does not belong here
Do not use Digital Factory to explain Jetson-local service failures.
Keep the printer pane and Jetson pane conceptually separate.
