#!/bin/sh
dotfiles=".vimrc .bashrc .tmux.conf"

for file in $dotfiles; do
    ln -sf "$HOME/dotfiles/$file" "$HOME/$file"
done
