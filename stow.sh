#!/usr/bin/env zsh

STOW_FOLDERS="ghostty,neovim,tmux,zsh"

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    stow -D $folder
    stow $folder
done
