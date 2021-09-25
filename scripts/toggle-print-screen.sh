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

ps cax|grep alacritty
if [ $? -eq 0 ]; then
  PID=`ps cax|grep alacritty | grep -o '^[ ]*[0-9]*'`
  echo "Process is already running [$PID]"
  kill -1 $PID && alacritty
else
  alacritty
fi

# todo: uitzoeken waarom wmctrl niet lekker werkt met Firefox, Alacritty? Iets met wayland of 64 bit vs 32?