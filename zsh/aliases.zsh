alias ai='sudo apt-get install'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias be='bundle exec'
alias beg='bundle exec guard'
alias cdr='cd $(git rev-parse --show-toplevel)'
alias ff='firefox'
alias g='hub'
alias git='hub'
alias gm='gmake'
alias gmc='gmake clean -j'
alias gvir='gvim --remote-send ":tabe<CR>" && gvim --remote'
alias hd='~/bin/hex_decimal.sh'
alias livestreamer='livestreamer --default-stream best'
alias ll='ls -al'
alias ls='ls -G'
alias mkcd='. ~/bin/make_dir_and_cd.sh'
alias rfwifi='nmcli r wifi off && nmcli r wifi on'
alias sbcl='rlwrap sbcl'
alias scheme='rlwrap scheme'
alias sqlite3='rlwrap sqlite3'
alias uu='sudo apt-get update && sudo apt-get upgrade'
alias wfc='weather -f NYC'

[ -f ~/.zsh_local/aliases_local.zsh ] && source ~/.zsh_local/aliases_local.zsh
