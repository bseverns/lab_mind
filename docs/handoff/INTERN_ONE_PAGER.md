# Intern One-Pager: Lab Mind

## What this system is

The lab has a stable spine and replaceable edge devices:

- R900: backups, storage, monitoring, dashboards, docs mirror, archive
- Jetson-A: assistant and model node
- Jetson-B and Jetson-C: edge support nodes
- Pis: kiosks, bridges, signage, sensors

## Start here

Open the cockpit:

```text
http://r900.local
```

If you need the assistant, open:

```text
http://jetson-a.local:3000
```

## Do not guess

Do not invent:

- Headscale values
- passwords
- printer names
- API keys
- CNC settings

Write down what is missing instead.

## First checks

- [ ] R900 powers on
- [ ] browser opens cockpit
- [ ] Open WebUI opens
- [ ] Digital Factory opens
- [ ] inventory template matches reality
- [ ] docs mirror opens
- [ ] operator toggle checklist is nearby if code mode needs to change

## Code mode switch

Use the operator toggle checklist for the code assistant:

- [`OPERATOR_TOGGLE_CHECKLIST.md`](OPERATOR_TOGGLE_CHECKLIST.md)

Use the model switch card for Jetson-A profile choices:

- [`MODEL_SWITCH_CARD.md`](MODEL_SWITCH_CARD.md)

Use the model choice ladder if you need the short version:

- [`MODEL_CHOICE_LADDER.md`](MODEL_CHOICE_LADDER.md)

## If stuck

Take a photo. Write the exact error. Stop changing things.
