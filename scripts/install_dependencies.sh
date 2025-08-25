#!/bin/bash
set -e

echo "Installing dependencies..."

# Update packages
sudo yum update -y

# Install Java 11 if not installed
if ! java -version &>/dev/null; then
  sudo amazon-linux-extras enable corretto11
  sudo yum install -y java-11-amazon-corretto
fi

# Install Tomcat if not installed
if [ ! -d "/opt/tomcat" ]; then
  echo "Installing Apache Tomcat..."
  cd /opt
  sudo curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.92/bin/apache-tomcat-9.0.92.tar.gz
  sudo tar xvf apache-tomcat-9.0.92.tar.gz
  sudo mv apache-tomcat-9.0.92 tomcat
  sudo rm -f apache-tomcat-9.0.92.tar.gz
fi

# Make sure permissions are correct
sudo chown -R ec2-user:ec2-user /opt/tomcat
chmod +x /opt/tomcat/bin/*.sh

echo "Dependencies installed successfully."
