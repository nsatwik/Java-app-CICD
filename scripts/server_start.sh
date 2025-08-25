#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/opt/myapp"
JAR="$APP_DIR/app.jar"
LOG_DIR="/var/log/myapp"
PID_FILE="$APP_DIR/app.pid"

mkdir -p "$LOG_DIR"

if [ -f "$PID_FILE" ] && ps -p $(cat "$PID_FILE") > /dev/null 2>&1; then
  echo "App already running with PID $(cat "$PID_FILE")"
  exit 0
fi

echo "[ApplicationStart] Starting app..."
nohup java -jar "$JAR" > "$LOG_DIR/app.out" 2>&1 &
echo $! > "$PID_FILE"
sleep 2
echo "Started with PID $(cat "$PID_FILE")"
