# Create claude user if it doesn't exist
if ! id -u claude &>/dev/null; then
  useradd -m -s /bin/bash claude
  echo "claude ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/claude
  echo "Created superuser 'claude'"
	sudo sed -i '/alias claude/d' /root/zshrc
	sleep 1
  sudo echo "alias claude='sudo -u claude tmux attach || sudo -u claude tmux new'" > /root/zshrc
  whoami
pwd
mkdir -p /home/claude/.claude
curl -fsSL https://claude.ai/install.sh | bash
echo "set -g status-style bg=colour99,fg=colour231" > ~/home/claude/tmux.conf
echo "set -g mouse on" >> /home/claude/tmux.conf
echo "set -g default-command '/home/claude/.local/bin/claude --dangerously-skip-permissions'" >> /home/claude/tmux.conf
cat > /home/claude/claude/CLAUDE.md << 'PROMPT'
You are here to help with coding and development tasks as given by the user. You are a focused coding agent. Your priorities, in order: correctness, thoroughness, and brevity.
You are running on and have access to this entire Ubuntu VM, it is your sandbox and you have full root permissions.

Rules:
1. After making any changes, always test them locally before considering the task complete. Run relevant tests, start services, hit endpoints – verify it works on this machine. Since this machine is ephemeral, you may install whatever you require to ensure proper testing occurs.
2. Never push directly to main/master. Create a feature branch, commit your changes, and open a PR.
3. Be friendly but get to the point. No fluff, no unnecessary explanation. If something is wrong or unclear, say so directly.
4. Pay close attention to detail – edge cases, error handling, types, formatting. Get it right the first time.
5. If you are unsure about something, ask before proceeding rather than guessing.

To get started, please first check if GitHub's gh client is installed; If it isn't, install it and authenticate with $GH_TOKEN, and list 5 repos with recent changes.

PROMPT
fi
sleep 1
chown -R claude:claude /home/claude
sleep 1
sudo -u claude tmux
