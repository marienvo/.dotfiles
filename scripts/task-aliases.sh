#!/bin/bash
alias start="task start"
alias syncinboxes="unison -batch -ui text \"/home/marienvanoverbeek/Documents/Obsidian/Home/Inbox/\" \"/home/marienvanoverbeek/Documents/Obsidian/Work/Inbox/\" -confirmbigdel=false"
alias sync="task sync && syncinboxes && fetch" # fetch is for ical's
alias u="task undo"

## Add with home context (from any context)
alias study="task add +home +study"
alias book="task add +home +books"

## Switch context
### work (default context, sub-tags: feedback)
alias work="task context work && next" # default context

### home (sub-tags: books, study)
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

_showInboxCount () { # private function
    COUNT=$(task count project: status:pending)
    if [[ "$COUNT" = "1" ]]
    then
        echo -e "\e[93mYou have $COUNT new task \e[0m\e[2m(inbox)"
    else
        echo -e "\e[93mYou have $COUNT new tasks \e[0m\e[2m(inbox)"
    fi
}

_inboxNotification () { # private function
	CONTEXT=$(task _get rc.context)
    if [ "$CONTEXT" = "work" ]
    then
#         chronic task next proj: &> /dev/null && _showInboxCount || echo "\e[2mNo new tasks" # chronic from moreutils
        echo "\e[2mNo new tasks"
    else
        echo "\e[2mHave a great day!"
    fi
}

_showTaskList () {
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
    _showTaskList
    inbox
}
def () { # get definition from dictionary - todo: move to different file
    clear
    curl "dict://dict.org/d:$@"
}
short () { # shorten URL - todo: move to different file
    curl -F"shorten=$@" http://0x0.st
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

# Show a list of all next tasks for a given project
# - There are two options for this command:
#   - list PROJECT (shows pending tasks, ready to pick up)
#   - list PROJECT -a (shows all tasks, pending or not)
list () {
    ARG="$2"
	if [[ $ARG = "" ]]
    then
        task next "proj:$1"
    elif [[ "$ARG" = "-a" ]]
    then
        task all "proj:$1"
    fi
}

# New tasks are going to the "inbox"
# - this contains all tasks that:
#   - don't have a project
#   - AND are pending (not waiting, not completed, not deleted)
inbox () { # All pending tasks without a project are "INBOX" chronic
    # Check if inbox has entries (chronic ... &> /dev/null - throw away output if so)
    # Show inbox if no error
    # Echo something on error (error because "Noting found", which is good in our case)
    chronic task next proj: &> /dev/null && task inbox || echo "\e[2mInbox is empty" # chronic from moreutils
}

# Next tasks are things to pick up next
# - this contains a list of tasks that:
#   - are ready (not blocked, not waiting)
next () { # Show any next task, independent of project - only context (work/home)
    CONTEXT=$(task _get rc.context)
    clear
    task logo
    sleep 0.3
    clear
    _showTaskList
    if [[ "$CONTEXT" = "work" ]]
    then
        inbox
    fi
}
