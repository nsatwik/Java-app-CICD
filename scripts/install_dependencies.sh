#!/bin/bash
set -e

echo "Installing dependencies..."

# Update packages
sudo yum update -y

# Install Java 17 (Corretto)
amazon-linux-extras enable corretto17
sudo yum install -y java-17-amazon-corretto

# Install Tomcat 9 if not installed
if [ ! -d "/opt/tomcat" ]; then
    echo "Installing Apache Tomcat..."
    cd /opt
    sudo curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.92/bin/apache-tomcat-9.0.92.tar.gz
    sudo tar xvf apache-tomcat-9.0.92.tar.gz
    sudo mv apache-tomcat-9.0.92 tomcat
    sudo rm -f apache-tomcat-9.0.92.tar.gz
fi

# Set full read/write/execute permissions safely
if [ -d "/opt/tomcat" ]; then
    sudo chmod -R 777 /opt/tomcat
    sudo chown -R ec2-user:ec2-user /opt/tomcat
fi

echo "Dependencies installed successfully."
