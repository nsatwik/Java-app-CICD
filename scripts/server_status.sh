#!/usr/bin/env bash
set -euo pipefail
APP_DIR="/opt/myapp"
PID_FILE="$APP_DIR/app.pid"

if [ -f "$PID_FILE" ] && ps -p $(cat "$PID_FILE") > /dev/null 2>&1; then
  echo "RUNNING (PID $(cat "$PID_FILE"))"
  exit 0
else
  echo "STOPPED"
  exit 1
fi
