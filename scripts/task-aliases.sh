#!/bin/bash
alias start="task start"
alias x="task done"
alias sync="task sync"
alias study="task add +home +study"
alias home="task context home"
alias work="task context work"

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
    echo "Start of day: check mail, meetings, clean-up (old) todo lists"
    task next
}