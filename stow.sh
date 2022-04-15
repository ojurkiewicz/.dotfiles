#!/usr/bin/env zsh

STOW_FOLDERS="alacritty,i3,neovim,tmux,zsh"

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    stow -D $folder
    stow $folder
done
