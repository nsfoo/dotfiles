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

sudo pacman -Syu --needed \
    neovim fish tmux \
    git docker zip unzip openssh trash-cli nnn curl lsd gcc fzf wget htop neofetch ripgrep \
    python python-poetry python-black \
    nodejs \
    rlwrap

# install pnpm
if [ -z "$(which pnpm)" ]; then 
  curl -fsSL https://get.pnpm.io/install.sh | sh -
fi

# change shell to fish
FISH=$(chsh -l | grep fish | sort -n | head -1)
if [ $FISH != $SHELL ] && [ -n $FISH ]; then
  chsh -s $FISH
fi

#neovim
if [ ! -f $HOME/.local/share/nvim/site/autoload/plug.vim ]; then
  curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  nvim +PlugInstall +qall
  nvim +"CocInstall coc-html coc-tsserver coc-json coc-pyright coc-css coc-markdownlint" +qall
fi
