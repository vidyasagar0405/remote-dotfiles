#!/usr/bin/env bash

sudo apt update -y && sudo apt upgrade -y

sudo apt install -y \
    git \
    curl \
    wget \
    tmux \
    zsh \


ln -s

cd $(mktemp -d)

URL="curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage"

curl -LO "$URL"
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract >/dev/null
mkdir -p ~/.local/bin
ln -s $(pwd)/squashfs-root/AppRun /home/gitpod/.local/bin/nvim

# Setup git completions for bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
echo "source ~/.git-completion.bash" >> ~/.bashrc
