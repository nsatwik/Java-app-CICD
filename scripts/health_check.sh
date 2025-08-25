#!/bin/bash
set -e

echo "Checking application health..."

# Example: check if Tomcat is running
if pgrep -f "org.apache.catalina.startup.Bootstrap" > /dev/null; then
    echo "Tomcat is running."
    exit 0
else
    echo "Tomcat is NOT running."
    exit 1
fi
