# 09 - Remote Access with Headscale

Remote access exists to reach private lab services without exposing them to the public internet.

Headscale is the control plane. It is not the app surface.

## What Headscale is for

- trusted device enrollment
- private reachability to the R900, Jetson-A, and the edge nodes
- narrow, authenticated remote admin access
- carrying one narrow private code-assistant path between Jetson-A and the R900 when that is the chosen deployment

## What Headscale is not for

- the public dashboard
- the model server
- the CNC controller
- a general office VPN by default
- a replacement for local safety or local wiring
- a reason to make every service reachable everywhere

## Editable details

Do not finalize these values until the control plane is real.

Use:

- `ops/lab/headscale-values.example`
- `templates/HEADSCALE_VALUES.example`

Keep placeholders for:

- Headscale server URL
- tailnet base domain
- enrollment method
- preauth key use
- node tags
- educator device enrollment

## Minimal access model

Default remote membership:

- Jetson-A
- R900
- trusted educator laptop(s)
- operator machine

Optional:

- Jetson-B if remote status checks are useful
- Jetson-C if remote docs access is useful

Avoid:

- student devices
- all classroom machines
- general office devices unless there is a documented reason

## Success checks

Remote access is working when:

1. the expected nodes appear in the Headscale node list
2. an educator laptop can reach Jetson-A privately
3. the R900 docs mirror opens privately
4. Portainer opens privately
5. no public port forwarding is required for the lab tools

## Operator note

When unsure, keep remote access narrower.
It is easier to widen a careful boundary than to clean up a sloppy one.
