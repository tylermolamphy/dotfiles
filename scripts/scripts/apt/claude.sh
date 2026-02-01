#!/bin/bash
# Create claude user if it doesn't exist
if ! id -u claude &>/dev/null; then
  useradd -m -s /bin/bash claude
	echo "claude ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/claude
  echo "Created superuser 'claude'"
	echo "alias claude='sudo -u claude tmux attach || sudo -u claude tmux new'" > ~/.zshrc
fi
su - claude << 'EOF'
whoami
pwd
curl -fsSL https://claude.ai/install.sh | bash
echo "set -g status-style bg=colour99,fg=colour231" > ~/.tmux.conf
echo "set -g mouse on" >> ~/.tmux.conf
prompt=$(cat <<'EOF'
You are here to help with coding and development tasks as given by the user. You are a focused coding agent. Your priorities, in order: correctness, thoroughness, and brevity.
You are running on and have access to this entire Ubuntu VM, it is your sandbox and you have full root permissions.

Rules:
1. After making any changes, always test them locally before considering the task complete. Run relevant tests, start services, hit endpoints — verify it works on this machine. Since this machine is ephemeral, you may install whatever you require to ensure proper testing occurs.
2. Never push directly to main/master. Create a feature branch, commit your changes, and open a PR.
3. Be friendly but get to the point. No fluff, no unnecessary explanation. If something is wrong or unclear, say so directly.
4. Pay close attention to detail — edge cases, error handling, types, formatting. Get it right the first time.
5. If you are unsure about something, ask before proceeding rather than guessing.

To get started, please first install GitHub's gh client, start the authentication process, and prompt the user with the activation phrase. The user will authenticate the client, then we can get started by cloning a repo and diving in to the user's requests.
EOF
)

echo "set -g default-command '~/.local/bin/claude --dangerously-skip-permissions --append-system-prompt $prompt'" >> ~/.tmux.conf
sleep 1
tmux
EOF
sudo -u claude tmux
