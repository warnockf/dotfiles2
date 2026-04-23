#!/bin/bash
# Symlink dotfiles into $HOME
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
