#!/bin/sh
set -ue

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# ─── Trust GitHub SSH Host Key ───────────────────────────────────────────────
mkdir -p "$HOME/.ssh"
ssh-keyscan -t ed25519 github.com >> "$HOME/.ssh/known_hosts" 2>/dev/null

# ─── Oh My Zsh ───────────────────────────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# ─── Symlink Dotfiles ────────────────────────────────────────────────────────
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo "Dotfiles installation complete"
exec zsh
