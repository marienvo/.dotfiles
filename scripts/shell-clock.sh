# Get context
CONTEXT=$(task _get rc.context)
if [ "$CONTEXT" != "books" ]
then
    ID=$(task next | sed -n 4p | xargs | awk '{print $1;}')
fi


_titleOfNextMeeting () {
    CALCURSE=$(calcurse -n | grep "\["| sed -r 's/\[([0-9]+):([0-9]+)\](.*)/\3/')
    TEXT=${CALCURSE##*( )}
    echo "$TEXT"
}
_minutesTillNextMeeting () {
    CCHOURS=$(calcurse -n | grep "\["| sed -r 's/\[([0-9]+):([0-9]+)\](.*)/\1/')
    HOURS=${CCHOURS##*( )}
    CCMINS=$(calcurse -n | grep "\["| sed -r 's/\[([0-9]+):([0-9]+)\](.*)/\2/')
    MINUTES=$((${CCMINS##*( )}+(HOURS*60))) # should have leading zeroes
    if [ "$MINUTES" -gt "59" ] || [ "$MINUTES" -eq "0" ]
    then
        echo ""
    else
        echo "0:$(printf %02d $MINUTES)"
    fi
}

# Create output line
DESCR=$(task _get $ID.description)
PROJECT=$(task _get $ID.project)
FREEMINUTES=$(_minutesTillNextMeeting)
SEPERATOR='    •    '
if [ -n "$DESCR" ] && [ -n "$PROJECT" ] && [ -n "$FREEMINUTES" ]
then
    echo "$(date "+%k:%M")  ∙  $CONTEXT  ∙  $FREEMINUTES $SEPERATOR $PROJECT #$ID  ∙  $DESCR"
elif [ -n "$DESCR" ] && [ -n "$PROJECT" ]
then
    echo "$(date "+%k:%M")  ∙  $CONTEXT $SEPERATOR $PROJECT #$ID  ∙  $DESCR"
elif [ -n "$DESCR" ]
then
    echo "$(date "+%k:%M")  ∙  $CONTEXT $SEPERATOR #$ID  ∙  $DESCR"
else
    echo "$(date "+%k:%M")  ∙  $CONTEXT"
fi

