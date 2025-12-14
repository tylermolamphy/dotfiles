#!/usr/bin/env bash
set -e

if [ "$EUID" -ne 0 ]; then
  echo "Run as root or with sudo"
  exit 1
fi

apt update
apt install -y curl ca-certificates gnupg lsb-release unzip

if ! command -v code >/dev/null 2>&1; then
  curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/ms.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms.gpg] https://packages.microsoft.com/repos/code stable main" \
    > /etc/apt/sources.list.d/vscode.list
  apt update
  apt install -y code
fi

useradd -m -s /bin/bash vscode || true
mkdir -p /home/vscode/work
chown -R vscode:vscode /home/vscode

cat >/etc/systemd/system/vscode-tunnel.service <<'EOF'
[Unit]
Description=VS Code Tunnel
After=network-online.target

[Service]
Type=simple
User=vscode
WorkingDirectory=/home/vscode
ExecStart=/usr/bin/code tunnel --accept-server-license-terms
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reexec
systemctl daemon-reload
systemctl enable vscode-tunnel

echo "Switching to vscode user to start tunnel and sign in"
sudo -u vscode -H bash -c "code tunnel --accept-server-license-terms"
sleep 3
systemctl start vscode-tunnel
systemctl status vscode-tunnel --no-pager
