# Work in progress - learning fish vs Bash
export EDITOR="/usr/bin/nvim"
export plugins=(git)

alias wayvpn='sudo openconnect gp_db.weareyou.com --protocol=gp --user=marien.vanoverbeek --no-dtls'
alias open='xdg-open'
alias ll='ls -lha'
alias vim='nvim'
alias wiki='nvim ~/Documents/VimWiki/index.wiki'

set CONTEXT (task _get rc.context)
if [ "$CONTEXT" = "work" ]
	cd ~/WebstormProjects/eneco-lift-up/Sources/Solution || exit
else
    cd || exit
end

starship init fish | source

alias start="task start"
alias sync="task sync"

## Add with home context
alias study="task add +home +study"
alias book="task add +home +books"

## Switch context
alias books="task context books && next"
alias home="task context home && next"
alias work="task context work && next" # default context

function showTaskList
	set CONTEXT (task _get rc.context)
    if [ "$CONTEXT" = "work" ]
        echo "Start of day: check mail, meetings, clean-up (old) todo lists"
        task next
    elif [ "$CONTEXT" = "books" ]
        echo "Books currently reading; keep making notes - keep reading"
        task books
    elif [ "$CONTEXT" = "home" ]
        echo "Alles in kleine stappen"
        task next -books # exclude books, since this list can be big
    end

end
function x
    clear
    task done "$argv"
    echo ''
    showTaskList
end
function add
	set CONTEXT (task _get rc.context)
	if [[ "$CONTEXT" = "work" ]]
		task add "$argv"
	else
		task add +"$CONTEXT" "$argv"
	end
end

#note () {
#	task "$1" annotate "${@:2}"
#}

#mod () {
#	task "$1" modify "${@:2}"
#}

function next
    clear
    task logo
    sleep 0.3
    clear
    showTaskList
end
