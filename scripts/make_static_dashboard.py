#!/usr/bin/env python3
from pathlib import Path
from datetime import datetime, timezone
import json

root = Path(__file__).resolve().parents[1]
status_path = root / "dashboard" / "status-example.json"
status = {
    "generated_at": datetime.now(timezone.utc).isoformat(),
    "nodes": {
        "r900": "unknown",
        "jetson-a": "unknown",
        "jetson-b": "unknown",
        "jetson-c": "unknown",
    },
    "links": {
        "R900 cockpit": "http://r900.lab.internal",
        "Open WebUI": "http://jetson-a.lab.internal:3000",
        "Digital Factory": "https://digitalfactory.ultimaker.com/",
        "Docs mirror": "http://r900.lab.internal/docs",
        "Portainer": "https://r900.lab.internal:9443",
    },
}
status_path.write_text(json.dumps(status, indent=2) + "\n")
print(f"Wrote {status_path}")
