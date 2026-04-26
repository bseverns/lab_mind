#!/usr/bin/env bash
set -euo pipefail

floating_hits=0
while IFS= read -r hit; do
  printf 'floating image tag found: %s\n' "$hit" >&2
  floating_hits=1
done < <(rg -n 'image:\s+.*(:latest|:main)\b' compose/*.yml || true)

exit "$floating_hits"
