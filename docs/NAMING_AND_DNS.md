# Naming and DNS

The lab should have stable names in layers.
Do not let one convenience layer pretend to be the whole naming system.

## Naming layers

| Layer | Purpose | Example |
|---|---|---|
| Friendly local names | easy to type on the room LAN | `r900.local`, `jetson-a.local` |
| Private names | stable control-plane or tailnet names | `r900.lab.internal`, `jetson-a.lab.internal` |
| Public names | only for real public surfaces | `docs.example.org` |

## Rules

- Friendly names are fine for a first pass.
- Private names are the canonical operational layer.
- Public names are only for services intentionally exposed to the internet.
- The lab should never need a public name for a private control path.

## Files to edit together

- `ops/lab/hostnames.example`
- `ops/lab/service-urls.example`
- `ops/lab/private-names.example`
- `ops/lab/headscale-values.example`

## Rule of thumb

If the name is going to appear in a recovery doc, it should be stable and explicit.
