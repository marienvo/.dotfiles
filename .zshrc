#!/bin/bash
export EDITOR="/usr/bin/nvim"
export ZSH="/home/marienvanoverbeek/.oh-my-zsh"
export ZSH_THEME="spaceship"
export SPACESHIP_BATTERY_SHOW="false"
export plugins=(git)

source /home/marienvanoverbeek/.oh-my-zsh/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/marienvanoverbeek/.dotfiles/scripts/task-aliases.sh

alias wayvpn='sudo openconnect gp_db.weareyou.com --protocol=gp --user=marien.vanoverbeek --no-dtls'
alias open='xdg-open'
alias ll='ls -lha'
alias vim='nvim'
alias wiki='nvim ~/Documents/VimWiki/index.wiki'

# Screensavers
alias s='cmatrix'
alias a='asciiquarium'
alias h='hollywood -q'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s /home/marienvanoverbeek/.autojump/etc/profile.d/autojump.sh ]] && source /home/marienvanoverbeek/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u


CONTEXT=$(task _get rc.context)
if [ "$CONTEXT" = "work" ]
then
	cd ~/WebstormProjects/eneco-lift-up/Sources/Solution || exit
else
    cd || exit
fi
source /etc/profile.d/bash_completion.sh
