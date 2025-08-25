#!/bin/bash
set -e
echo "Stopping Tomcat..."
if [ -d "/opt/tomcat" ]; then
    /opt/tomcat/bin/shutdown.sh || true
fi
