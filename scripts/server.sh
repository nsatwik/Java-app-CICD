#!/usr/bin/env bash
# Convenience wrapper to manage the app: ./server.sh [start|stop|status|restart]
set -euo pipefail
CMD="${1:-status}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$CMD" in
  start)   "$SCRIPT_DIR/server_start.sh" ;;
  stop)    "$SCRIPT_DIR/server_stop.sh" ;;
  status)  "$SCRIPT_DIR/server_status.sh" ;;
  restart) "$SCRIPT_DIR/server_stop.sh" || true; sleep 2; "$SCRIPT_DIR/server_start.sh" ;;
  *) echo "Usage: $0 [start|stop|status|restart]"; exit 2;;
esac
