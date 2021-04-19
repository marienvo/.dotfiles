#!/bin/bash
######################################################################################################
# This script will toggle minimize/activate first window with specified class
# If window not found program will be launched
#
# window class can be found with next programs:
#   wmctrl -x -l
#   xprop
#
#
# **IMPORTANT**
# No credit taken.......... Cannot read the original.....
# Found on http://blog.sokolov.me/2014/06/20/linuxx11-toggle-window-minimizemaximize/
# in Russian :) but works when adjusting the wrapping.
# Assigned to meta-f in KDE plasma 5
######################################################################################################
NEEDED_WINDOW_CLASS="Navigator.Firefox"
######################################################################################################
NEEDED_WINDOWS_WINDOW_ID_HEX=`wmctrl -x -l | grep ${NEEDED_WINDOW_CLASS} | awk '{print $1}' | head`
SOME_WINDOW_IS_ACTIVE="false"
# Read first window
for HEX in $NEEDED_WINDOWS_WINDOW_ID_HEX
do
    FIRST_WINDOW_WINDOW_ID_DEC=$((${HEX}))
    if [ -z "${HEX}" ]; then
        echo 'Browser not found'
    else
        echo "Found window ID:${FIRST_WINDOW_WINDOW_ID_DEC}(0x${HEX})"
        ACTIVE_WINDOW_DEC=`xdotool getactivewindow`
        if [ "${ACTIVE_WINDOW_DEC}" == "${FIRST_WINDOW_WINDOW_ID_DEC}" ]; then
            SOME_WINDOW_IS_ACTIVE="true"
        fi
    fi
done

# Loop through windows
for HEX in $NEEDED_WINDOWS_WINDOW_ID_HEX
do
    NEEDED_WINDOW_WINDOW_ID_DEC=$((${HEX}))
    if [ -z "${HEX}" ]; then
        echo 'Browser not found'
    else
        echo "Found window ID:${NEEDED_WINDOW_WINDOW_ID_DEC}(0x${HEX})"
        # if [ "${SOME_WINDOW_IS_ACTIVE}" == "true" ]; then
            # xdotool windowminimize ${NEEDED_WINDOW_WINDOW_ID_DEC}
        # else
            xdotool windowactivate ${NEEDED_WINDOW_WINDOW_ID_DEC}
        # fi
    fi
done

