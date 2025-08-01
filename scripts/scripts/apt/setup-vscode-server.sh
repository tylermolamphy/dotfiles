#!/bin/bash

set -e

# Install dependencies
sudo apt update && sudo apt install -y curl wget tar jq libglib2.0-0 libnss3 libxshmfence1 libatk1.0-0 libatk-bridge2.0-0 libx11-xcb1 libxcomposite1 libxdamage1 libxrandr2 libgbm1 libasound2 libpangocairo-1.0-0 libcairo2

# Create code-server dir
mkdir -p ~/.vscode-server/bin

# Get latest commit
COMMIT=$(curl -s https://update.code.visualstudio.com/api/commits/stable | jq -r '.[0].version')

# Download and extract
TMP_DIR=$(mktemp -d)
curl -L "https://update.code.visualstudio.com/commit:${COMMIT}/server-linux-x64/stable" -o "$TMP_DIR/vscode-server.tar.gz"
mkdir -p ~/.vscode-server/bin/$COMMIT
tar -xzf "$TMP_DIR/vscode-server.tar.gz" -C ~/.vscode-server/bin/$COMMIT --strip-components=1
rm -rf "$TMP_DIR"

# Write systemd unit
cat <<EOF | sudo tee /etc/systemd/system/vscode-server.service
[Unit]
Description=VS Code Server
After=network.target

[Service]
Type=simple
User=$USER
ExecStart=/home/$USER/.vscode-server/bin/$COMMIT/bin/code-server --accept-server-license-terms --host 127.0.0.1 --port 8888
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Enable and start service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now vscode-server

exit 0