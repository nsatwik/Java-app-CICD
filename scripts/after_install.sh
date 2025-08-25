#!/bin/bash
set -e

echo "Setting permissions on deployed WAR..."

# WAR deployment path
WAR_PATH="/opt/tomcat/webapps/myapp.war"

if [ -f "$WAR_PATH" ]; then
    sudo chmod 777 "$WAR_PATH"
    sudo chown ec2-user:ec2-user "$WAR_PATH"
fi

echo "After install completed."
