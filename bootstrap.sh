#!/bin/bash

conf=$HOME/.config
pwd=$(pwd)

lns(){
  [ -L $conf/$1 ] || ln -s $pwd/$1 $conf/
}

lns tmux
lns nvim
lns fish
lns gitui

sudo pacman -Syu \
    neovim fish tmux \
    git docker zip unzip openssh trash-cli nnn curl lsd gcc fzf wget htop neofetch \
    python python-poetry python-black \
    nodejs \
    rlwrap

curl -fsSL https://get.pnpm.io/install.sh | sh -

chsh -s /bin/fish

#vim-plug
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#:CocInstall coc-html coc-tsserver coc-json coc-pyright coc-css coc-markdownlint

