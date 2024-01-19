#!/bin/bash

OS=$(uname)

[ ! -d "$HOME/.config/nvim" ] && ln -s $(pwd)/nvim ~/.config/nvim
[ ! -d "$HOME/.config/alacritty" ] && ln -s $(pwd)/alacritty ~/.config/alacritty
[ ! -d "$HOME/.config/tmux" ] && ln -s $(pwd)/tmux ~/.config/tmux

if [ $OS = "Linux" ]; then
    [ ! -d "$HOME/.config/i3" ] && ln -s $(pwd)/i3 ~/.config/i3
    [ ! -d "$HOME/.config/polybar" ] && ln -s $(pwd)/polybar ~/.config/polybar
else
	[ ! -d "$HOME/.config/yabai" ] && ln -s $(pwd)/yabai ~/.config/yabai
fi
