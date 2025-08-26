#!/bin/bash
set -e

echo "Installing Maven dependencies..."

# install wget and unzip
yum install -y wget unzip

# download Maven
wget https://archive.apache.org/dist/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.zip

# unzip instead of tar
unzip apache-maven-3.9.5-bin.zip -d /opt/

# set environment variables
export M2_HOME=/opt/apache-maven-3.9.5
export PATH=$M2_HOME/bin:$PATH

# check Maven version
mvn -v
