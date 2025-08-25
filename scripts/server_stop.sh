#!/bin/bash
set -e

echo "Stopping Tomcat server..."

if [ -f /opt/tomcat/bin/shutdown.sh ]; then
    sudo /opt/tomcat/bin/shutdown.sh || true
fi

echo "Tomcat stopped."
