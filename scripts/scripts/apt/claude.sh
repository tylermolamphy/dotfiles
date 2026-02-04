# Create claude user if it doesn't exist
if ! id -u claude &>/dev/null; then
  useradd -m -s /bin/bash claude
  echo "claude ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/claude
  echo "Created superuser 'claude'"
  echo "alias claude='sudo -u claude tmux attach || sudo -u claude tmux new'" > ~/.zshrc
fi
su - claude << 'OUTER'
whoami
pwd
curl -fsSL https://claude.ai/install.sh | bash
echo "set -g status-style bg=colour99,fg=colour231" > ~/.tmux.conf
echo "set -g mouse on" >> ~/.tmux.conf

cat > /tmp/claude_prompt.txt << 'PROMPT'
If gh is not installed, install it and prompt for auth.
PROMPT

PROMPT_ESCAPED=$(sed "s/'/'\\\\''/g" /tmp/claude_prompt.txt | tr '\n' ' ')
echo "set -g default-command '~/.local/bin/claude --dangerously-skip-permissions --append-system-prompt ${PROMPT_ESCAPED}'" >> ~/.tmux.conf
OUTER
sleep 1
tmux
EOF
sudo -u claude tmux
