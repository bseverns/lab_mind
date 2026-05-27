#!/bin/bash
# relay_vgpu_telemetry.sh
# Purpose: Collect NVIDIA GPU metrics and push to the ClassHub Homework Helper.
# Setup: Run this as a cron job or background loop on the ThunderCompute node.

set -e

# Configuration
HELPER_URL="${HELPER_URL:-http://localhost:8000}"
INTERNAL_TOKEN="${HELPER_INTERNAL_API_TOKEN}"
CLASS_ID="${CLASS_ID}"

if [[ -z "$INTERNAL_TOKEN" || -z "$CLASS_ID" ]]; then
    echo "Error: HELPER_INTERNAL_API_TOKEN and CLASS_ID must be set."
    exit 1
fi

# 1. Collect Metrics via nvidia-smi
# We parse: utilization.gpu, memory.used, memory.total
METRICS=$(nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total --format=csv,noheader,nounits | head -n 1)

if [[ -z "$METRICS" ]]; then
    echo "Error: Could not collect metrics from nvidia-smi."
    exit 1
fi

UTIL=$(echo $METRICS | cut -d',' -f1 | tr -d ' ')
MEM_USED=$(echo $METRICS | cut -d',' -f2 | tr -d ' ')
MEM_TOTAL=$(echo $METRICS | cut -d',' -f3 | tr -d ' ')

echo "Collected: GPU Load: ${UTIL}%, Mem: ${MEM_USED}/${MEM_TOTAL}MB"

# 2. Push to Homework Helper
PAYLOAD=$(cat <<EOF
{
  "class_id": $CLASS_ID,
  "gpu_utilization": $UTIL,
  "gpu_memory_used_mb": $MEM_USED,
  "gpu_memory_total_mb": $MEM_TOTAL
}
EOF
)

RESPONSE=$(curl -s -X POST \
  -H "Authorization: Bearer $INTERNAL_TOKEN" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD" \
  "$HELPER_URL/helper/internal/remote-compute-telemetry")

if echo "$RESPONSE" | grep -q '"ok":true'; then
    echo "Success: Telemetry pushed to $HELPER_URL"
else
    echo "Error: Failed to push telemetry. Response: $RESPONSE"
    exit 1
fi
