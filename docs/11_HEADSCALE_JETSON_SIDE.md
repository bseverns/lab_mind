# Headscale Jetson Side

## Summary
This page covers the Jetson-side use of Headscale-managed private access.

The VPS itself is documented separately in `ops/headscale/`.
This page is for the Jetson, not for the control-plane host.

## Editable values
Use:
- `ops/jetson/HEADSCALE_VALUES.example`

Do not hard-code final values here until the VPS is settled.

## Keep editable
- `HEADSCALE_SERVER_URL`
- `HEADSCALE_BASE_DOMAIN`
- `HEADSCALE_ENROLLMENT_METHOD`
- `HEADSCALE_PREAUTH_KEY`
- `HEADSCALE_NODE_TAGS`

## Enrollment rule
Do not pretend the method is final until it truly is.

Use this sequence:
1. fill in the real server URL
2. choose the real enrollment method
3. add a preauth key only if that is the approved method
4. enroll the Jetson
5. confirm the node appears in the Headscale-admin view
6. confirm one educator machine can reach the Jetson privately
7. open browser tools over the private path

## Success signal
Private access is working only when:
- node membership is visible
- educator device reaches the Jetson privately
- browser-first tools open across the private path
