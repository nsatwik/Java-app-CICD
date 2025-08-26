#!/bin/bash
set -e

TOMCAT_VERSION=9.0.81
TOMCAT_DIR=/opt/tomcat

echo "Installing Tomcat..."

# Install Java if not installed
yum install -y java-17-amazon-corretto wget tar

# Download and extract Tomcat
wget https://dlcdn.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz -O /tmp/tomcat.tar.gz
mkdir -p $TOMCAT_DIR
tar -xzf /tmp/tomcat.tar.gz -C $TOMCAT_DIR --strip-components=1

# Set permissions
chmod +x $TOMCAT_DIR/bin/*.sh
chown -R ec2-user:ec2-user $TOMCAT_DIR

echo "Tomcat installed at $TOMCAT_DIR"
