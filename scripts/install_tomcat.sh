#!/bin/bash
set -e
TOMCAT_DIR=/opt/tomcat
TOMCAT_VERSION=9.0.73

echo "Installing Tomcat..."
if [ ! -d "$TOMCAT_DIR" ]; then
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
    tar -xzf apache-tomcat-$TOMCAT_VERSION.tar.gz
    mv apache-tomcat-$TOMCAT_VERSION $TOMCAT_DIR
    chmod +x $TOMCAT_DIR/bin/*.sh
    echo "Tomcat installed at $TOMCAT_DIR"
else
    echo "Tomcat already installed at $TOMCAT_DIR"
fi
