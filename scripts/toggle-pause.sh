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
# todo: context work vs home terugbrengen / bij home element ipv alacrity
BROWSER="Navigator.Firefox"
NOTES="obsidian.obsidian"
BROWSER_HEX=`wmctrl -x -l | grep ${BROWSER} | awk '{print $1}' | head`
NOTES_WINDOW=`wmctrl -x -l | grep ${NOTES} | awk '{print $1}' | head -n 1`
FOUND_NOTES=$((${NOTES_WINDOW}))
######################################################################################################
ACTIVE_WINDOW=`xdotool getactivewindow`
if [ "${ACTIVE_WINDOW}" == "${FOUND_NOTES}" ]; then
    # Loop through browser windows and focus them
    for HEX in $BROWSER_HEX
    do
        BROWSER_WINDOW=$((${HEX}))
        if [ -z "${HEX}" ]; then
            echo 'Browser not found'
        else
            xdotool windowactivate ${BROWSER_WINDOW}
        fi
    done
else
    xdotool windowactivate ${FOUND_NOTES}
fi










