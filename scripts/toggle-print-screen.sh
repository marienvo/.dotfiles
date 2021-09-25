#!/bin/bash
ps cax|grep peek
if [ $? -eq 0 ]; then
  PID=`ps cax|grep peek | grep -o '^[ ]*[0-9]*'`
  echo "Process is already running [$PID]"
else
  flatpak run com.uploadedlobster.peek
fi
