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
SLACK="slack.Slack"
ALACRITTY="Alacritty"
SLACK_WINDOW=`wmctrl -x -l | grep ${SLACK} | awk '{print $1}' | head -n 1`
ALACRITTY_WINDOW=`wmctrl -x -l | grep ${ALACRITTY} | awk '{print $1}' | head -n 1`
FOUND_SLACK=$((${SLACK_WINDOW}))
ALACRITTY_FOUND=$((${ALACRITTY_WINDOW}))
######################################################################################################
ACTIVE_WINDOW=`xdotool getactivewindow`
if [ "${ACTIVE_WINDOW}" == "${ALACRITTY_FOUND}" ]; then
    xdotool windowminimize ${ALACRITTY_FOUND}
    xdotool windowactivate ${FOUND_SLACK}
fi
if [ "${ACTIVE_WINDOW}" == "${FOUND_SLACK}" ]; then
    xdotool windowminimize ${FOUND_SLACK}
fi
if [ "${ACTIVE_WINDOW}" != "${ALACRITTY_FOUND}" ] && [ "${ACTIVE_WINDOW}" != "${FOUND_SLACK}" ]; then
    xdotool windowactivate ${ALACRITTY_FOUND}
fi
