#!/bin/bash

sudo /opt/distrod/bin/distrod enable 

echo "[user]
default=$USER

[interop]
enabled=true
appendWindowsPath=false

[network]
hostname=arch
generateHosts=false" | sudo tee /etc/wsl.conf

# cp alacritty (link not working)
dir="/mnt/c/Users/$USER/AppData/Roaming/alacritty"
if [ ! -d $dir ];then
  mkdir $dir
fi
if [ ! -f "$dir/alacritty.yml" ];then
  cp $(pwd)/alacritty/alacritty.yml $dir/alacritty.yml
fi

# neovim wsl clipboard
if [ ! -x "$(command -v win32yank.exe)" ];then
  curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
  unzip -p /tmp/win32yank.zip win32yank.exe >/tmp/win32yank.exe
  chmod +x /tmp/win32yank.exe
  sudo mv /tmp/win32yank.exe /usr/local/bin/
fi
