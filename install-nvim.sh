#!/usr/bin/env bash

sudo apt-get install -y stow
stow bash
stow nvim
stow starship
stow tmux

cd $(mktemp -d)

URL="https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"
if test -n "$NEOVIM_VERSION"
then
    URL="https://github.com/neovim/neovim/releases/download/$NEOVIM_VERSION/nvim.appimage"
fi

curl -LO "$URL"
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract >/dev/null
mkdir -p ~/.local/bin
ln -s $(pwd)/squashfs-root/AppRun /home/gitpod/.local/bin/nvim
