#!/bin/bash

# man sleep
#   suspend execution
#   'sleep <seconds>'

# help shift
#   shift [<n>]
#   shift positional parameters
#   rename positional parameters $N+1,$N+2... to $1,$2...
#   <n> defaults to 1
#   fails if n<0 or n>$#.

# help while
# while <command>; do <commands>; done

while [[ "$#" -gt 0 ]]
do
  echo "Args: $# ---> First: $1"
  sleep 3
  shift 1
done
# > $0 arg1 "arg 2" 'arg 3'
# Args: 3 ---> First: arg1
# Args: 2 ---> First: arg 2
# Args: 1 ---> First: arg 3
