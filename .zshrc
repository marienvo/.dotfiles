#!/bin/bash
export EDITOR="/usr/bin/nvim"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="spaceship"
export SPACESHIP_BATTERY_SHOW="false"
export plugins=(git)

source $HOME/.oh-my-zsh/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.dotfiles/scripts/task-aliases.sh

alias wayvpn='sudo openconnect gp.weareyou.com --protocol=gp --user=marien.vanoverbeek --no-dtls'
alias open='xdg-open'
alias ll='ls -lha'
alias vim='nvim'
alias wiki='nvim ~/Documents/VimWiki/index.wiki'
alias fixmock='mv ../Services/ServicesMocks/DC.ServicesMocks/mappings/apiMocks/** ../Services/ServicesMocks/DC.ServicesMocks/mappings/'
alias signal='signal-cli -u +31650964655'
alias weer='curl http://v2.wttr.in/Rotterdam'

# Calendar functions:
alias fetch='chronic $HOME/.dotfiles/scripts/fetch-calendars.sh'
alias today='calcurse -stoday'
alias tomorrow='calcurse -stomorrow'

# Screensavers
alias s='cmatrix'
alias news='newsboat'
alias pod='podboat -a'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

function home () {
    cd "$(<~/.tmp_marked_working_dir)" || clear
}
home

source /etc/profile.d/bash_completion.sh

# Always check inbox on opening new terminal windows
#  -> they need to get to projects; and/or taken care of immediately
# _inboxNotification

# Functions used by Shell Clock
function _minutesTillNextMeeting () {
    HOURS=${$(calcurse -n | grep "\["| sed -r 's/\[([0-9]+):([0-9]+)\](.*)/\1/')##*( )}
    MINUTES=$((${$(calcurse -n | grep "\["| sed -r 's/\[([0-9]+):([0-9]+)\](.*)/\2/')##*( )}+(HOURS*60)))
    echo "$MINUTES"
}
function _titleOfNextMeeting () {
    TEXT=${$(calcurse -n | grep "\["| sed -r 's/\[([0-9]+):([0-9]+)\](.*)/\3/')##*( )}
    echo "$TEXT"
}

rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER)
  REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}
function transfer () {
#     cloud_url="http://cloud.marienvanoverbeek.nl"
    cloud_url="http://localhost:8080"
    file="$1"
    file_name=$(basename "$file" | sed -f ~/.dotfiles/url_escape.sed);
#    echo $file_name
     cat "$file"|curl -s --upload-file "-" "$cloud_url/$file_name"&&echo "";
}

# Quick upload latest image from Pictures folder (i.e. screenshots)
function qq () {
    transfer "$(find $HOME/Pictures/ -name "*" -print0 | xargs -r -0 ls -1 -t 2>/dev/null | head -1)"
    ##| xargs firefox
}

export FLYCTL_INSTALL="/home/marienvanoverbeek/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.dotfiles/bin:/home/linuxbrew/.linuxbrew/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
fpath=($fpath "$HOME/.zfunctions")
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
eval $(thefuck --alias)
export DENO_INSTALL="/home/marienvanoverbeek/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/marienvanoverbeek/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end