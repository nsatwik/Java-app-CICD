#!/bin/bash
set -e
TOMCAT_DIR=/opt/tomcat

echo "Starting Tomcat..."
if [ -d "$TOMCAT_DIR" ]; then
    $TOMCAT_DIR/bin/startup.sh
    echo "Tomcat started."
else
    echo "Tomcat not found!"
    exit 1
fi
