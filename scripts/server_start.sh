#!/bin/bash
set -e

echo "Starting Tomcat server..."

if [ -f /opt/tomcat/bin/startup.sh ]; then
    sudo /opt/tomcat/bin/startup.sh
fi

echo "Tomcat started."
