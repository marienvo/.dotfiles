#!/bin/bash
export EDITOR="/usr/bin/nvim"
export ZSH="/home/marienvanoverbeek/.oh-my-zsh"
export ZSH_THEME="spaceship"
export SPACESHIP_BATTERY_SHOW="false"
export plugins=(git)

source /home/marienvanoverbeek/.oh-my-zsh/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/marienvanoverbeek/.dotfiles/scripts/task-aliases.sh

alias wayvpn='sudo openconnect gp-db.weareyou.com --protocol=gp --user=marien.vanoverbeek --no-dtls --servercert pin-sha256:Y5ultT1EG3ZMiGQIZIbsqDqqPpjGAFcnrrJlUjcNGWg='
alias open='xdg-open'
alias ll='ls -lha'
alias vim='nvim'
alias wiki='nvim ~/Documents/VimWiki/index.wiki'
alias fixmock='mv ../Services/ServicesMocks/DC.ServicesMocks/mappings/apiMocks/** ../Services/ServicesMocks/DC.ServicesMocks/mappings/'
alias signal='signal-cli -u +31650964655'
alias weer='curl http://v2.wttr.in/Rotterdam'

# Calendar functions:
alias fetch='chronic /home/marienvanoverbeek/.dotfiles/scripts/fetch-calendars.sh'
alias today='calcurse -stoday'
alias tomorrow='calcurse -stomorrow'

# Screensavers
alias s='cmatrix'
alias a='asciiquarium'
alias h='hollywood -q'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s /home/marienvanoverbeek/.autojump/etc/profile.d/autojump.sh ]] && source /home/marienvanoverbeek/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

cd "$(<~/.tmp_marked_working_dir)" || clear

source /etc/profile.d/bash_completion.sh

# Always check inbox on opening new terminal windows
#  -> they need to get to projects; and/or taken care of immediately
_inboxNotification

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
export PATH="$HOME/.yarn/bin:$HOME/.dotfiles/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fpath=($fpath "/home/marienvanoverbeek/.zfunctions")

