# 09 — Remote Access with Headscale

## Purpose

Remote access lets trusted educators and operators reach Jetson-A without being physically in the lab.

The remote path should be private and narrow.

## What Headscale does

Headscale coordinates tailnet membership. It is the control plane. It is not:

- the model server
- the public dashboard
- the CNC controller
- a general office VPN
- a substitute for local safety

## Editable details

Do not finalize this doc until the VPS is real.

Use:

- `templates/HEADSCALE_VALUES.example`
- `ops/jetson/HEADSCALE_VALUES.example`

Keep values editable for:

- Headscale server URL
- tailnet base domain
- enrollment method
- preauth key use
- node tags
- educator device enrollment

## Minimal access model

Default remote membership:

- Jetson-A
- trusted educator laptop(s)
- operator machine

Optional:

- Jetson-B if remote status checks are useful
- Jetson-C if remote docs access is useful

Avoid:

- student devices
- all classroom machines
- general office devices

## Success checks

Remote access works when:

1. Jetson-A appears in Headscale node list.
2. An educator laptop can reach Jetson-A over private network.
3. Open WebUI opens privately.
4. Portainer opens privately.
5. Docs open privately.
6. No public port forwarding is required.

## Operator note

When unsure, leave remote access narrower. It is easier to widen a careful boundary than to clean up a sloppy one.
