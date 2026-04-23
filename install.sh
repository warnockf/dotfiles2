#!/bin/bash
# Symlink dotfiles into $HOME
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
