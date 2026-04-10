# Architecture

## Summary
The architecture is intentionally simple: one edge compute box, one private access plane, one printer cloud pane, and one optional local CNC path.

```mermaid
flowchart LR
  User["Educator browser"]
  HS["Headscale control plane<br/>hs.creatempls.org"]
  J["Jetson-A<br/>private lab brain"]
  DF["Digital Factory"]
  P["Sketch / Sketch+ / Method X"]
  C["Cubiko CNC<br/>optional local USB"]

  User -. private reachability coordination .- HS
  HS -. private reachability coordination .- J

  User -->|private browser access| J
  User -->|cloud/browser| DF
  DF --> P
  J -->|optional local USB| C
```

## Service picture

```mermaid
flowchart TD
  Browser["Browser"]
  Portainer["Portainer"]
  OWUI["Open WebUI"]
  Ollama["Ollama"]
  NR["Node-RED"]
  ST["Syncthing"]
  CNC["CNCjs (optional)"]
  SSD["NVMe data root"]

  Browser --> Portainer
  Browser --> OWUI
  Browser --> NR
  Browser --> ST
  Browser --> CNC

  OWUI --> Ollama
  Portainer --> SSD
  OWUI --> SSD
  NR --> SSD
  ST --> SSD
  CNC --> SSD
```

## Key boundary
Request traffic for private operator tools should **not** traverse the public internet as open services.
Use the Headscale-managed private path for operator access.
