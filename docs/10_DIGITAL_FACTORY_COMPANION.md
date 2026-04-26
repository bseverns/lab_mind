# 10 - Digital Factory Companion

Digital Factory remains the source of truth for the printer fleet.
The lab should help humans remember what should be there, not replace the cloud system.

## Expected fleet

Do not invent final printer values in the repo.
Use the inventory templates and fill the real machine list when it is known.

Suggested templates:

- `templates/PRINTER_INVENTORY.csv`
- `templates/DIGITAL_FACTORY_WORKSPACE.example.md`
- `templates/DIGITAL_FACTORY_CHECK.md`

## First check

Open Digital Factory and confirm:

- correct account
- correct workspace
- all expected printers visible
- printer names make sense
- no mystery duplicate machines
- queue or status information visible

## Browser-first companion tasks

Jetson-A can display the bookmark and checklist.
The R900 can keep the archive copy of those notes.
Edge nodes can display room-side status if that helps, but they are not the source of truth.

## Missing printer flow

1. Do not rename things first.
2. Record which printer is missing.
3. Check printer power.
4. Check network connection.
5. Check Digital Factory workspace/account.
6. Restart only the affected printer if appropriate.
7. Record what fixed it.

## Rule

If the printer fleet count is not yet real, leave it as a placeholder.
