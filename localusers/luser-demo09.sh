#!/bin/bash

# Case Statements

# if [[ <condition> ]] then <commands>; elif [[ <condition> ]] then <commands> fi
#
if [[ "$1" = 'start' ]]
then
  echo 'Starting...'
elif [[ "$1" = 'stop' ]]
then
  echo 'Stopping...'
else
  echo 'Error' >&2
  exit 1
fi
# Starting...

# case <word> in (<pattern>[|<pattern]) <commands> ;; [...] esac
#
#  Built-in command.
#  
case "$1" in
  (start|--stop) 
    echo 'Starting...'
    ;;
  (stop|--stop) echo 'Stopping...' ;;
  (*)
    echo 'Error' >&2
    exit 1
    ;;
esac
# Starting...


