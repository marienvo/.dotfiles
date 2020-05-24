# Get context
CONTEXT=$(task _get rc.context)
if [ "$CONTEXT" != "books" ]
then
    ID=$(task next | sed -n 4p | xargs | awk '{print $1;}')
fi

# Create output line
DESCR=$(task _get $ID.description)
PROJECT=$(task _get $ID.project)
SEPERATOR='         '
if [ -n "$DESCR" ]
then
    echo "$(date "+%k:%M")  ∙  $CONTEXT $SEPERATOR #$ID  ∙  $DESCR  ∙  $PROJECT"
else
    echo "$(date "+%k:%M")  ∙  $CONTEXT"
fi

