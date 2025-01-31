#!/usr/bin/env bash

sudo apt update -y && sudo apt upgrade -y

sudo apt install -y \
    git \
    curl \
    wget \
    tmux \
    zsh \

rm -rf ~/.bash_aliases
rm -rf ~/.bash_funcs
rm -rf ~/.bashrc
rm -rf ~/.config/nvim
rm -rf ~/.config/tmux
rm -rf ~/.zshrc

ln -s .bash_aliases ~/.bash_aliases
ln -s .bash_funcs ~/.bash_funcs
ln -s .bashrc ~/.bashrc
ln -s nvim ~/.config/nvim
ln -s tmux ~/.config/tmux
ln -s .zshrc ~/.zshrc

URL="curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage"

curl -LO "$URL"
chmod u+x nvim*
./nvim.appimage --appimage-extract >/dev/null
mkdir -p ~/.local/bin
ln -s squashfs-root/AppRun ~/.local/bin/nvim

# Setup git completions for bash
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
echo "source ~/.git-completion.bash" >> ~/.bashrc
