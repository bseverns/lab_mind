# Image Versions

This file is the lock sheet for container image choices.
Keep it current with the compose files.

## Current pins

| Image | Pin | Used in | Notes |
|---|---|---|---|
| `ghcr.io/open-webui/open-webui` | `git-f2a360c-cuda@sha256:fbcc95aa89c372c0ba536aa3298a037b95f7b2e1cb5549849667817f8661fa1c` | Jetson-A assistant stacks | pinned to a specific published package version |
| `ghcr.io/ggml-org/llama.cpp` | `server-cuda12-b8840@sha256:a92a756344dffd35e93a693f771113c0ec7753701d83bab5a65ec8aae325491c` | Jetson-A local model backends | CUDA-capable local server image lock |
| `ghcr.io/ggml-org/llama.cpp` | `server-b8840@sha256:99d2554c4c8d5339649dde530056cf10771823d7cd983dbd0441da9c419976b1` | R900 remote code backend | CPU-backed spine image lock |
| `portainer/portainer-ce` | `2.39.0` | R900 | stable CE line |
| `nodered/node-red` | `4.1.8` | R900 | maintenance release |
| `caddy` | `2.11.2-alpine` | cockpit / internal site | stable release |
| `syncthing/syncthing` | `2.0.16` | Jetson-C | file sync node |
| `cncjs/cncjs` | `v1.11.0` | optional CNC node | only if CNC path is real |

## Notes

- If a pin changes, update this file and the compose files in the same commit.
- Prefer exact tags or digests over floating `latest` or `main`.
- If a digest is known, include it in the compose file or in a comment beside the tag.
