#!/bin/bash

# man bash - search for 'Positional Parameters'
# man bash - search for 'Special Parameters'

# Positional and special parameters:
#  $0 name of the script
#  $n script's n-th argument, where n > 0
#  $# number of positional parameters
#  $@ expands parameters to separate words
#  $* expands parameters to a single word
#  $? holds the status of last executed command
#
# Arguments can be single- or double-quote enclosed
# to include whitespace characters.
# E.g., script.sh arg1 "arg 2" 'arg 3'

if [[ "$#" -lt 1 ]]
then
  echo "Usage: $0 ARG [ARG]..."
  exit 1
fi

echo "Args: $#"
# Args: 3
echo "First arg: $1"
# First arg: arg1

help for
# for <value> [in <values>...]; do <commands>; done

for ARG in "$@"; do echo "Arg: $ARG"; done;
# Arg: arg1
# Arg: arg 2
# Arg: arg 3

for ARG in "$*"; do echo "Arg: $ARG"; done;
# Arg: arg1 arg 2 arg 3

for X in Value1 "Value 2" 'Value 3'
do
  echo "$X"
done
# Value1
# Value 2
# Value 3


# man basename
# man dirname
# return filename or directory of path
#
# basename <path> [<suffix-to-strip>]
# basename -a <path> <path> ... [-s <suffix-to-strip>]
# dirname <path> <path> ...

basename $0
# 02-positional-params.sh
basename $0 .sh
# 02-positional-params
dirname $0
# ./03-password-generation
