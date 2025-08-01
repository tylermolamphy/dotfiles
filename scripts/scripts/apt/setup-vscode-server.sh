#!/bin/bash
set -e

# Install base deps
sudo apt update && sudo apt install -y curl wget tar hostname jq

# Get Tailscale hostname
TS_HOSTNAME=$(tailscale status --json | jq -r '.Self.HostName')

# Install VS Code CLI
curl -fsSL https://aka.ms/install-vscode-server/setup.sh | sh

# Create systemd unit for VS Code tunnel
cat <<EOF | sudo tee /etc/systemd/system/vscode-tunnel.service
[Unit]
Description=VS Code Remote Tunnel
After=network.target

[Service]
Type=simple
User=$USER
Environment=PATH=/home/$USER/.vscode-server/bin/*/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
ExecStart=/home/$USER/.vscode-server/bin/*/bin/code tunnel --name $TS_HOSTNAME --accept-server-license-terms
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload and enable the tunnel
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable --now vscode-tunnel

code tunnel