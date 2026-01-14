#!/bin/bash
# Create claude user if it doesn't exist
if ! id -u cclaude &>/dev/null; then
  useradd -m -s /bin/bash cclaude
  echo "Created user 'cclaude'"
	rm /etc/profile
fi
su - cclaude << 'EOF'
whoami
pwd
curl -fsSL https://claude.ai/install.sh | bash
echo ~/.local/bin/claude --dangerously-skip-permissions > ~/.bashrc
rm ~/.profile ~/.bash_profile ~/.bash_login
chsh -s /bin/bash
~/.local/bin/claude --dangerously-skip-permissions
EOF
