#!/bin/bash

# The while Loop, Infinite Loops, Shifting, Sleeping

# shift <n>
#
#  Shifts (left) the positional parameters by n.
#  Left parameters are discarded.
#  
#  <n> defaults to 1.
#
echo "$#"
echo "$@"
shift 2
echo "$#"
echo "$@"
# 5
# a b c d e
# 3
# c d e

# while <condition-commands>; do <commands>; done
#
#  Executes commands as long as contidion commands succeed (exit status zero).
#
while [[ "${#}" -gt 0 ]]
do
  echo "${#} - ${1}"
  shift
done
# 3 - c
# 2 - d
# 1 - e

# sleep <number>
#
#  Executable program in the system (not a bash built-in).
#  Delays for a specified amount of time.
#  
#  <number> defaults to seconds.
#  Suffixes: s, m, h, d.
#
echo "Sleeping..."
sleep 1
sleep .5s
# Sleeping...