#!/bin/bash

# #!<interpreter-path>
#  
#  - shebang tells which interpreter to use
#    when running commands inside the script 
#
#  - e.g. #!/usr/bin/python
#  
#  - equivalent to
#    > /bin/bash <script-file>

# permissions
#
#  - drwxrwxrwx
#    - d directory or - file
#    - r read, w write, x execute, - none
#    - first group is owner permissions
#    - second group is group permissions
#    - last group is other user's permission
#  
#  - e.g.
#    > ls -l
#    $ -rwxr-xr-x  1 josue staff 1143 Dec 7 21:38 luser-demo01.sh

# chmod rwx <file>
#
#  - set permissions to files
#
#  - r = 4
#  - w = 2
#  - x = 1
#  - - = 0 (none)

# shell built-in commands
#
#  - can be executed directly in the shell,
#    without needing to inform the command path or
#    adding them to the system path
#
#  - e.g.
#    > type -a echo
#    $ echo is a shell builtin
#    $ echo is /usr/bin/echo

# man <command>
#
#  - displays commands documentation

# script variables
#
#  - can be named with letters, digits and underscore
#    (not starting with digits)
#  - naming conventions tell to use uppercase
#  - are case-sensitive
#  
#  - assignments CANNOT have spaces between
#    variable, equal sign, and value
#
#  - single quotes prevent variable expansion
#
#  - $ is used to reference a variable's value
#  - ${} must be used when appending content 
#    to variables inside a string 
#
WORD='script'
ending='ed'

# overriding variable values
ending='ing'

# echo <content>
#
#  - prints content to stdout

echo 'Hello'
# $ Hello

echo "$WORD"
# $ script

echo '$WORD'
# $ $WORD

echo "This is a shell $WORD"
# $ This is a shell script
echo "This is a shell ${WORD}"
# $ This is a shell script

echo "${WORD}ing is fun"
# $ scripting is fun

echo "$WORDing is fun"
# $  is fun

echo "This is ${WORD}${ENDING}"
# $ This is script

echo "${WORD}$ending is fun"
# $ scripting is fun

