#!/bin/bash
set -e

echo "Installing Tomcat..."

# Variables
TOMCAT_VERSION=10.1.12
TOMCAT_DIR=/opt/tomcat

# Install dependencies
yum update -y
yum install -y wget tar java-17-amazon-corretto

# Remove old Tomcat if exists
if [ -d "$TOMCAT_DIR" ]; then
    echo "Removing existing Tomcat..."
    rm -rf $TOMCAT_DIR
fi

# Download and extract Tomcat
wget https://archive.apache.org/dist/tomcat/tomcat-10/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz -O /tmp/apache-tomcat.tar.gz
mkdir -p $TOMCAT_DIR
tar xzf /tmp/apache-tomcat.tar.gz -C $TOMCAT_DIR --strip-components=1

# Set permissions
chown -R ec2-user:ec2-user $TOMCAT_DIR
chmod +x $TOMCAT_DIR/bin/*.sh

# Clean up
rm -f /tmp/apache-tomcat.tar.gz

echo "Tomcat installed successfully at $TOMCAT_DIR"
