#!/usr/bin/env bash
set -euo pipefail

echo "[ValidateService] Checking service health..."
curl -sf http://localhost:8080/ >/dev/null
echo "OK"
