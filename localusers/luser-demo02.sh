#!/bin/bash

# UID
# 
#  Read-only, preset shell variable.
#  ID of current user.
#  Root user ID is always 0.
#
# $ man bash
# /UID
# :n
# :shift+n

echo "Your UID is ${UID}"
# Your UID is 0

# id -un [<user>]
#
#  Returns user info.
#
#  -u UID
#  -un user name 

id
# uid=0(root) gid=0(root) groups=0(root)

id -u
# 0

id -n
# id: cannot print only names or real IDs in default format 

id -u -n
# root

# whoami
#
#  Returns user name.
#  Same as id -un.

whoami
# root

# $()
# 
#  Command expressions.
#  Can be used for, e.g., storing command output into variables.
#
USER_NAME=$(id -un)
echo "Your username is $USER_NAME"
# Your username is root

# ``
#
#  Equivalent, old syntax for command expressions.
#
USER_ID=`id -u`
echo "Your user ID is $USER_ID"
# Your user ID is 0

# if [[ <condition> ]]
# then
#   <commands>
# else
#   <commands>
# fi
#
#  If statement.
#  
#  if keyword must be followed by a space.
#  Condition is enclosed in double brackets.
#  Opening brackets must be followed by a space.
#  Closing brackets must be preceeded by a space.
#  Variables referenced inside condition must be enclosed in double quotes.

if [[ "${UID}" -eq 0 ]]
then
  echo 'You are root'
else
  echo 'You are not root'
fi
# You are root

# [[
#
#  Shell built-in command.
#  Executes a conditional command.
#  Returns a status of 0 or 1, depending on the
#    evaluation of the conditional expression inside it.
#
# [ 
#
#  Equivalent, old syntax.

#  Logical (short-circuit) operators.
#
# &&, ||

# Arithmetic binary operators.
#
#  -eq, -ne, -lt, -le, -gt, -ge
# 
#  ==, !=, <, <=, >, >=

# ;
#
#  Alternative command separator for single-line, multi-command statements.

if [[ $(id -un) -ne 0 ]]; then echo 'Not root'; else echo 'You are...'; echo '...root'; fi
# You are...
# ...root

