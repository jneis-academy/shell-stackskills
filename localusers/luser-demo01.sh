#!/bin/bash

# Getting started with shell scripting: naming, permissions, variables, built-ins.

# #!<interpreter-path>
#  
#  Shebang tells which interpreter to use
#    when running commands inside the script.
#
#  E.g.
#    $ #!/usr/bin/python
#  
#  Equivalent to
#    $ /bin/bash <script-file>

# File permissions.
#
#  drwxrwxrwx
#    d directory or - file.
#    r read, w write, x execute, - none.
#    First group is owner permissions.
#    Second group is group permissions.
#    Last group is other user's permission.
#  
#  E.g.
#    $ ls -l
#    -rwxr-xr-x  1 josue staff 1143 Dec 7 21:38 luser-demo01.sh

# chmod rwx <file>
#
#  Set permissions to files.
#
#  r = 4
#  w = 2
#  x = 1
#  - = 0 (none)

# Shell built-in commands.
#
#  Can be executed directly in the shell,
#    without needing to inform the command path or
#    adding them to the system path.
#
#  E.g.
#    $ type -a echo
#    echo is a shell builtin
#    echo is /usr/bin/echo

# man <command>
#
#  Displays scripts documentation.

# Script variables.
#
#  Can be named with letters, digits and underscore (not starting with digits).
#  Naming conventions tell to use uppercase.
#  Are case-sensitive.
#  
#  Assignments CANNOT have spaces between variable, equal sign, and value.
#  Variable values can be overriden.
#
#  Single quotes prevent variable expansion.
#
#  $ is used to reference a variable's value.
#  ${} must be used when appending content to variables inside a string.

WORD='script'
ending='ed'
ending='ing'

# echo <content>
#
#  Prints content to stdout.

echo 'Hello'
# Hello

echo "$WORD"
# script

echo '$WORD'
# $WORD

echo "This is a shell $WORD"
# This is a shell script
echo "This is a shell ${WORD}"
# This is a shell script

echo "${WORD}ing is fun"
# scripting is fun

echo "$WORDing is fun"
#  is fun

echo "This is ${WORD}${ENDING}"
# This is script

echo "${WORD}$ending is fun"
# scripting is fun
