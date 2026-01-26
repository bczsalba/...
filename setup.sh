#!/usr/bin/env bash

mkdir $HOME/.config/vim/.{swap,undo}
ln -sf "$HOME/.config/bash/bashrc" "$HOME/.bashrc"
ln -sf "$HOME/.config/bash/bash_profile" "$HOME/.bash_profile"
ln -sf "$HOME/.config/vim/vimrc" "$HOME/.vimrc"
ln -sf "$HOME/.config/vim" "$HOME/.vim"
