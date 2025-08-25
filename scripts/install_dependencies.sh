#!/usr/bin/env bash
set -euo pipefail

echo "[BeforeInstall] Installing dependencies and preparing directories..."

if command -v yum >/dev/null 2>&1; then
  sudo yum update -y || true
  sudo yum install -y java-17-amazon-corretto-headless || true
elif command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update -y || true
  sudo apt-get install -y openjdk-17-jre-headless || true
fi

sudo mkdir -p /opt/myapp/scripts /var/log/myapp
sudo chown -R ec2-user:ec2-user /opt/myapp /var/log/myapp
