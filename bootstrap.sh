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

#:CocInstall coc-html coc-tsserver coc-json coc-pyright coc-css coc-markdownlint
