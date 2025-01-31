#!/usr/bin/env bash

# Update & Install Dependencies
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git curl wget tmux zsh fd-find ripgrep fzf zoxide

# Fix Symbolic Link Loops
rm -rf ~/.bash_aliases ~/.bash_funcs ~/.bashrc ~/.config/nvim ~/.config/tmux ~/.zshrc

ln -s "$(pwd)/.bash_aliases" ~/.bash_aliases
ln -s "$(pwd)/.bash_funcs" ~/.bash_funcs
ln -s "$(pwd)/.bashrc" ~/.bashrc
ln -s "$(pwd)/nvim" ~/.config/nvim
ln -s "$(pwd)/tmux" ~/.config/tmux
ln -s "$(pwd)/.zshrc" ~/.zshrc

# Ensure ~/.bashrc and ~/.zshrc are only sourced if not symlinks
if [ -L ~/.bashrc ]; then
    source ~/.bashrc
fi

if [ -L ~/.zshrc ]; then
    source ~/.zshrc
fi

# Fix Neovim Download URL
URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage"
curl -LO "$URL"

# Ensure Neovim is Downloaded Before Proceeding
if [ -f "nvim-linux-x86_64.appimage" ]; then
    chmod u+x nvim-linux-x86_64.appimage
    ./nvim-linux-x86_64.appimage --appimage-extract >/dev/null
    mkdir -p ~/.local/bin
    rm -f ~/.local/bin/nvim
    ln -s "$(pwd)/squashfs-root/AppRun" ~/.local/bin/nvim
else
    echo "Neovim download failed!"
fi

# Setup Git Completions
curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
echo "source ~/.git-completion.bash" >> ~/.bashrc
