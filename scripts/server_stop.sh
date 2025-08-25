#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/opt/myapp"
PID_FILE="$APP_DIR/app.pid"

if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE")
  if ps -p $PID > /dev/null 2>&1; then
    echo "[ApplicationStop] Stopping PID $PID"
    kill $PID
    sleep 3
    if ps -p $PID > /dev/null 2>&1; then
      echo "Force killing PID $PID"
      kill -9 $PID || true
    fi
  fi
  rm -f "$PID_FILE"
else
  echo "No PID file found; app may not be running."
fi
