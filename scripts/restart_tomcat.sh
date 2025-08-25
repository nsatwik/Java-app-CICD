#!/bin/bash
set -e

echo "Restarting Tomcat..."

# Stop Tomcat
if [ -f /opt/tomcat/bin/shutdown.sh ]; then
  /opt/tomcat/bin/shutdown.sh || true
  sleep 5
fi

# Start Tomcat
/opt/tomcat/bin/startup.sh

echo "Tomcat restarted successfully."
