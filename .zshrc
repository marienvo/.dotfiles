export ZSH="/home/marienvanoverbeek/.oh-my-zsh"

ZSH_THEME="spaceship"
SPACESHIP_BATTERY_SHOW="false"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Language environment
# export LANG=en_US.UTF-8

alias wayvpn='sudo openconnect gp_db.weareyou.com --protocol=gp --user=marien.vanoverbeek --no-dtls'
alias open='xdg-open'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -s /home/marienvanoverbeek/.autojump/etc/profile.d/autojump.sh ]] && source /home/marienvanoverbeek/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# Something is wrong with this: - it can't be above ^ that nvm stuff? Parse error
source ~/.dotfiles/scripts/task-aliases.sh

CONTEXT=$(task _get rc.context)
if [ "$CONTEXT" = "home" ]
then
	cd
else
	cd ~/WebstormProjects/eneco-lift-up/Sources/Solution
fi
