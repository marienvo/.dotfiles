CONTEXT=$(task _get rc.context)
if [ "$CONTEXT" = "work" ]
then
	ID=$(task active | sed -n 4p | xargs | awk '{print $1;}')
else
	ID=$(task next | sed -n 4p | xargs | awk '{print $1;}')
fi

DESCR=$(task _get $ID.description)
if [ -n "$DESCR" ]
then
        echo "$(date "+%k:%M")       ∙       $DESCR ($ID)"
else
  date "+%k:%M"
fi

