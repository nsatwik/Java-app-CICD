#!/usr/bin/env bash
set -euo pipefail

echo "[AfterInstall] Setting permissions..."
sudo chown -R ec2-user:ec2-user /opt/myapp
chmod +x /opt/myapp/scripts/*.sh || true
