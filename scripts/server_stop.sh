#!/bin/bash
set -e
TOMCAT_DIR=/opt/tomcat

echo "Stopping Tomcat..."
if [ -d "$TOMCAT_DIR" ]; then
    $TOMCAT_DIR/bin/shutdown.sh
    echo "Tomcat stopped."
else
    echo "Tomcat not found!"
    exit 1
fi
