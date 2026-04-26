# Headscale Notes

This folder is a placeholder for the private access control plane notes.

Headscale is the control plane, not the app surface.

It should stay narrow:

- enrollment and policy for trusted devices
- private reachability to the lab nodes
- no public dashboard duties
- no model serving duties
- no CNC proxy duties
- no general office VPN duties unless that is separately documented

Use `ops/lab/headscale-values.example` for editable values and `ops/lab/service-urls.example` for service endpoints.
