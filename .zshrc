#!/bin/bash
export EDITOR="/usr/bin/nvim"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="spaceship"
export SPACESHIP_BATTERY_SHOW="false"
export plugins=(git)

function pci {
    sudo dnf update
    sudo ufw enable && sudo freshclam
    clear
    /home/marienvanoverbeek/WebstormProjects/pci-workstation/pci-check.py
    rm ./email.txt
}

source $HOME/.oh-my-zsh/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.dotfiles/scripts/task-aliases.sh

function fixemo () {
    cd /home/marienvanoverbeek/.dotfiles
    npm run emo  "$1"
    cd -
}
alias wayvpn='sudo openconnect gp.weareyou.com --protocol=gp --user=marien.vanoverbeek --no-dtls'
alias fixicon='sudo ln -sf /home/marienvanoverbeek/.dotfiles/assets/md.obsidian.Obsidian.png /var/lib/flatpak/app/md.obsidian.Obsidian/current/active/export/share/icons/hicolor/512x512/apps/md.obsidian.Obsidian.png'
# alias open='xdg-open' not needed for macOS
alias ll='ls -lha'
alias t='todo.sh'
function x () {
    todo.sh done "$1"
    due # not silent, will remind me of first due task
}
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
# alias s='cmatrix'
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

function s {
    cd ~/Pictures/Screenshots > /dev/null 2>&1
    identify -format "H: %h\n" "$(ls -t|head -1)"
    identify -format "W: %w\n" "$(ls -t|head -1)"
    cd - > /dev/null 2>&1
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
# function transfer () {
# #     cloud_url="http://cloud.marienvanoverbeek.nl"
#     cloud_url="http://localhost:8080"
#     file="$1"
#     file_name=$(basename "$file" | sed -f ~/.dotfiles/url_escape.sed);
# #    echo $file_name
#      cat "$file"|curl -s --upload-file "-" "$cloud_url/$file_name"&&echo "";
# }
transfer(){ if [ $# -eq 0 ];then echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;return 1;fi;if tty -s;then file="$1";file_name=$(basename "$file");if [ ! -e "$file" ];then echo "$file: No such file or directory">&2;return 1;fi;if [ -d "$file" ];then file_name="$file_name.zip" ,;(cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null,;else cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;else file_name=$1;curl --progress-bar --upload-file "-" "https://transfer.sh/$file_name"|tee /dev/null;fi;}

# Quick upload latest image from Pictures folder (i.e. screenshots)
function qq () {
    transfer "$(find $HOME/Pictures/ -name "*" -print0 | xargs -r -0 ls -1 -t 2>/dev/null | head -1)"
    ##| xargs firefox
}

export FLYCTL_INSTALL="/home/marienvanoverbeek/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
fpath=($fpath "$HOME/.zfunctions")
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
eval $(thefuck --alias)
export DENO_INSTALL="/home/marienvanoverbeek/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/marienvanoverbeek/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# bun completions
[ -s "/home/marienvanoverbeek/.bun/_bun" ] && source "/home/marienvanoverbeek/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# Show todos (if any)
today=$(date "+%Y-%m-%d")  # Get today's date in YYYY-MM-DD format
todo.sh list | sed 's/\x1b\[[0-9;]*m//g' | head -n -2 | grep -v '^[0-9]\+ x ' | awk -v today="$today" '{for(i=1;i<=NF;i++) if ($i ~ /^due:/ && substr($i,5) > today) next}1' | sed -E 's/^([0-9]{1,3}) [0-9]{4}-[0-9]{2}-[0-9]{2} /\1 /; s/\b[^ ]*:[^ ]+\b//g'

