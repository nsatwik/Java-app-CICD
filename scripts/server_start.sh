#!/bin/bash
set -e
echo "Starting Tomcat..."
if [ -d "/opt/tomcat" ]; then
    /opt/tomcat/bin/startup.sh
    echo "Tomcat started."
else
    echo "Tomcat not found!"
    exit 1
fi
