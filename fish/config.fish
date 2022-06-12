eval (ssh-agent -c) >/dev/null 2>&1
ssh-add $HOME/.ssh/id_ed25519 >/dev/null 2>&1
set fish_greeting

set -gx EDITOR nvim
set -gx NNN_TRASH 1
set -gx MOZ_ENABLE_WAYLAND 1

set -gx FZF_DEFAULT_OPTS '
--layout=reverse
--color=bg+:0,pointer:2,fg+:2,hl:5,hl+:5,info:3
'
set -gx FZF_DEFAULT_COMMAND 'rg --hidden -l ""'

alias n "nnn -H -o"
alias rm "echo Use 'trash', or the full path i.e. '/bin/rm'"
alias ls lsd
alias cat bat


if [ -x "$(command -v wl-copy)" ]
    alias c wl-copy
end
if [ -x "$(command -v win32yank.exe)" ]
    alias c "win32yank.exe -i"
end

abbr S "sudo pacman -Syu"
abbr Rs "sudo pacman -Rs"
abbr Ss "pacman -Ss"
abbr sr "source $HOME/.config/fish/config.fish"

set -gx NNN_TRASH 1
set -gx NNN_FCOLORS 0404040000000600010F0F02

set -gx PATH $PATH $HOME/.local/bin
set -gx PATH $PATH $HOME/.cargo/bin
set -gx PATH $PATH $HOME/.node_modules/bin
#pnpm
set -gx PNPM_HOME $HOME/.local/share/pnpm
set -gx PATH $PNPM_HOME $PATH
#kubectl
abbr ka "kubectl apply -f"
#q
set -gx QHOME $HOME/.local/bin/q
set -gx PATH $PATH $HOME/.local/bin/q
set -gx QREMOTE_HOME $HOME/.local/bin/qremote
set -gx PATH $PATH $HOME/.local/bin/qremote/bin
abbr q "rlwrap q -c \$(tput lines) \$(tput cols)"
abbr qr "qremote -c \$(tput lines) \$(tput cols)"
