#!/bin/bash
alias start="task start"
alias sync="task sync"
alias u="task undo"

## Add with home context (from any context)
alias study="task add +home +study"
alias book="task add +home +books"

## Switch context
### work (default context, sub-tags: feedback)
alias work="task context work && next" # default context

### home (sub-tags: books, study)
alias home="task context home && next" # main context for home
alias books="task context books && next" # sub-context for home

## Work projects
# me (just my problem)
# jira (tickets - can be both ops or tos)
# docs.xxx (lu, deleg, scrum, repo)
# eds (design system)
# ops (task or discuss at meeting)
# ops.deleg (delegated ops task)
# tos (task or discuss at meeting)
# tos.daily (mention/discuss at scrum daily 8:45)
# tos.deleg (delegated tos task)

_showInbox () { # private function
    echo -e "\e[93mNew tasks: \e[0m\e[2m(do immediately or add to project)"
    task inbox
}

inbox () { # All pending tasks without a project are "INBOX" chronic
    # Check if inbox has entries (chronic ... &> /dev/null - throw away output if so)
    # Show inbox if no error
    # Echo something on error (error because "Noting found", which is good in our case)
    chronic task next proj: &> /dev/null && _showInbox || echo "\e[2mNo new tasks" # chronic from moreutils
}

showTaskList () {
	CONTEXT=$(task _get rc.context)
    if [ "$CONTEXT" = "work" ]
    then
        echo "Start of day: check mail & meetings"
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
x () { # Cross of the list / mark done
    clear
    task done "$@"
    echo ''
    showTaskList
}
p () { # Add to project
    task modify $1 "project:$2"
    echo ''
    task ready "project:$2"
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

next () { # Show any next task, independent of project - only context (work/home)
    clear
    task logo
    sleep 0.3
    clear
    showTaskList
}

list () { # Show a list of all next tasks for a given project
    ARG="$2"
	if [[ $ARG = "" ]]
    then
        task next "proj:$1"
    elif [[ "$ARG" = "-a" ]]
    then
        task all "proj:$1"
    fi
}