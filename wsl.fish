#!/bin/fish --no-config

sudo echo "[interop]
enabled=true # enable launch of Windows binaries; default is true
appendWindowsPath=false # append Windows path to $PATH variable; default is true

[network]
hostname=arch
generateHosts=false" >/etc/wsl.conf

# neovim wsl clipboard
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe >/tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/