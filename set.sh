#!/bin/bash

[ ! -d "$HOME/.config/nvim" ] && ln -s $(pwd)/nvim ~/.config/nvim
[ ! -d "$HOME/.config/yabai" ] && ln -s $(pwd)/yabai ~/.config/yabai
[ ! -d "$HOME/.config/alacritty" ] && ln -s $(pwd)/alacritty ~/.config/alacritty
