#!/bin/sh
dotfiles=".vimrc .bashrc .tmux.conf"

for file in $dotfiles; do
    cp "$file" "$HOME/"
done
