#!/bin/bash
# Create claude user if it doesn't exist
if ! id -u claude &>/dev/null; then
  useradd -m -s /bin/bash claude
  echo "Created user 'claude'"
fi
su - claude << 'EOF'
whoami
pwd
curl -fsSL https://claude.ai/install.sh | bash
echo "set -g status-style bg=colour99,fg=colour231" > ~/.tmux.conf
echo "set -g mouse on" >> ~/.tmux.conf
echo "set -g default-command '~/.local/bin/claude --dangerously-skip-permissions'" >> ~/.tmux.conf
sleep 1
tmux
EOF
sudo -u claude tmux
