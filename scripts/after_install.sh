#!/bin/bash
set -e
echo "After install tasks..."
if [ -f "/opt/tomcat/logs/catalina.out" ]; then
    sudo rm -f /opt/tomcat/logs/catalina.out
fi
echo "After install completed."
