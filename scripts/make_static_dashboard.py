#!/usr/bin/env python3
from pathlib import Path
from datetime import datetime, timezone
import json

root = Path(__file__).resolve().parents[1]
status_path = root / "dashboard" / "status-example.json"
status = {
    "generated_at": datetime.now(timezone.utc).isoformat(),
    "nodes": {
        "labbrain-a": "unknown",
        "labbrain-b": "unknown",
        "labbrain-c": "unknown",
    },
    "links": {
        "Open WebUI": "http://labbrain-a.local:3000",
        "Digital Factory": "https://digitalfactory.ultimaker.com/",
        "Docs fallback": "http://labbrain-c.local",
    },
}
status_path.write_text(json.dumps(status, indent=2) + "\n")
print(f"Wrote {status_path}")
