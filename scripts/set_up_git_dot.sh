#!/bin/bash

# 1. Define variables
DOT_DIR="$HOME/.cfg"
ALIAS_NAME="config"
GITHUB_REPO_URL="https://github.com"

# 2. Initialize the bare repository
echo "Initializing bare repository in $DOT_DIR..."
git init --bare "$DOT_DIR"

# 3. Create the alias for this session
# This allows us to use 'config' instead of a long git command
function config {
   /usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"
}

# 4. Configure the repository to hide untracked files
# This ensures 'config status' only shows files you explicitly added
config config --local status.showUntrackedFiles no

# 5. Add the alias to your shell config (.bashrc or .zshrc)
# This makes the 'config' command permanent for future terminal sessions
SHELL_CONFIG="$HOME/.bashrc"
[[ $SHELL == *"zsh"* ]] && SHELL_CONFIG="$HOME/.zshrc"

if ! grep -q "alias $ALIAS_NAME=" "$SHELL_CONFIG"; then
    echo "Adding alias to $SHELL_CONFIG..."
    echo "alias $ALIAS_NAME='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> "$SHELL_CONFIG"
fi

# 6. Add your first file and push
echo "Adding .bashrc as a test file..."
config add "$HOME/.bashrc"
config commit -m "Initial dotfiles commit"
config remote add origin "$GITHUB_REPO_URL"

echo "------------------------------------------------"
echo "Setup complete! To push to GitHub, run:"
echo "  config push -u origin main"
echo "------------------------------------------------"
