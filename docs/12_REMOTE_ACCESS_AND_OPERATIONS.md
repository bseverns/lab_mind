# Remote Access and Operations

## Preferred pattern
Use:
- private network membership
- browser-first tools
- SSH only when needed
- full desktop remote control only as a last resort

## Why
The main things you want are web-shaped:
- Open WebUI
- Portainer
- Node-RED
- Syncthing
- CNCjs
- Digital Factory

## Operators
Maintain a short list of allowed remote operators.
Document them in:
- `ops/jetson/templates/operator_access_list.md`

## Good habit
When remote:
- change one thing at a time
- record what you changed
- do not debug printers and Jetson services as one single blob
