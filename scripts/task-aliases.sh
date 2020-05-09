add () {
	CONTEXT=$(task _get rc.context)
	if [ "$CONTEXT" = "work" ]
	then
		task add $@
	else
		task add +$CONTEXT $@
	fi
}

alias next="clear && task next"
alias mod="task modify $@"
alias start="task start"
alias done="task done"
alias sync="task sync"
alias study="task add +home +study"
alias home="task context home"
alias work="task context work"

note () {
	task "$1" annotate ${@:2}
}
