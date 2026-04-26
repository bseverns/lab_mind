#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "docs/CURRENT_STATE.md"
  "docs/TESTED_VALUES.md"
  "docs/KNOWN_GOOD_STATE.md"
  "docs/EXPERIMENTAL_SURFACES.md"
  "docs/IMAGE_VERSIONS.md"
  "docs/NAMING_AND_DNS.md"
  "docs/PRIVATE_BACKEND_BOUNDARY.md"
  "docs/HEALTHCHECK_MATRIX.md"
  "docs/OWNERSHIP_MAP.md"
  "docs/MAINTENANCE_CADENCE.md"
  "docs/BOARD_CASE_FOR_INFRASTRUCTURE.md"
  "docs/handoff/DASHBOARD_BOOKMARKS.html"
  "ops/lab/private-names.example"
  "ops/lab/image-values.example"
  "templates/BOARD_BUDGET_TIERS.example.md"
)

missing=0
for path in "${required_files[@]}"; do
  if [[ ! -f "$path" ]]; then
    printf 'missing required docs surface: %s\n' "$path" >&2
    missing=1
  fi
done

exit "$missing"
