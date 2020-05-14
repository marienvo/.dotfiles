#!/bin/bash
alias start="task start"
alias sync="task sync"

## Add with home context
alias study="task add +home +study"
alias book="task add +home +books"

## Switch context
alias books="task context books && next"
alias home="task context home && next"
alias work="task context work && next" # default context

showTaskList () {
	CONTEXT=$(task _get rc.context)
    if [ "$CONTEXT" = "work" ]
    then
        echo "Start of day: check mail, meetings, clean-up (old) todo lists"
        task next
    elif [ "$CONTEXT" = "books" ]
    then
        echo "Books currently reading; keep making notes - keep reading"
        task books
    elif [ "$CONTEXT" = "home" ]
    then
        echo "Alles in kleine stappen"
        task next -books # exclude books, since this list can be big
    fi

}
x () {
    clear
    task done "$@"
    echo ''
    showTaskList
}
add () {
	CONTEXT=$(task _get rc.context)
	if [[ "$CONTEXT" = "work" ]]
	then
		task add "$@"
	else
		task add +"$CONTEXT" "$@"
	fi
}

note () {
	task "$1" annotate "${@:2}"
}

mod () {
	task "$1" modify "${@:2}"
}

next () {
    clear
    task logo
    sleep 0.3
    clear
    showTaskList
}