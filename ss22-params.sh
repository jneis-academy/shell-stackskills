#!/bin/bash

# Positional parameters, Arguments, for Loops, Special Parameters

# Positional parameters
# 
#  Contain the contents of the command line when running a script.
#
#  ${0} contains the name of the script.
#  ${n} contains the value of the nth argument.
#
echo "${0} ${1} ${2}"
# luser-demo06.sh first-arg 2nd-arg

# PATH
# 
#  bash built-in variable.
#  Colon-separated list of directories in which the shell look for commands.
#
echo "$PATH"
# /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# which -a <program-name>
# 
#  Locates a program file in the user's PATH.
#
#  -a list all matching executables in the PATH (the first one found would be executed).
#
which head
# /usr/bin/head

# hash [-lr] 
# 
#  Displays or forget remembered (cached) program locations of current shell session.
#
#  -l list all remembered program locations.
#  -r forget all remembered program locations.
#
#  This cache is the reason why, sometimes, after uninstalling a program, bash gives
# an error saying the program was not found (because cache is still loaded with last location).
#
hash -l
# builtin hash -p /usr/bin/which which
# builtin hash -p /bin/chmod chmod
# builtin hash -p /usr/bin/man man
# builtin hash -p /bin/ls ls

# basename <file-path>
# 
#  Strips directory from file paths.
#
basename "${0}"
# luser-demo06.sh

# dirname <file-path>
# 
#  Strips last component from file paths.
#
dirname "${0}"
dirname "/stackskills/shell-scripts/localusers/luser-demo06.sh"
# .
# /stackskills/shell-scripts/localusers/

# IFS
# 
#  bash built-in variable.
#  Internal field separator.
#  Used for word splitting after expansion.
#  Used to split lines into words with read built-in command.
#  Default value is `<space><tab><new-line>`.
#
echo "${IFS}"
#
#

# Special (shell) parameters
# 
#  # expands to the number of positional parameters, in decimal.
#  @ expands to the positional parameters, space-separated (multiple values, equivalent to "$1" "$2"...).
#  * expands to the positional parameters, separated by first character of IFS special variable (single value).
#
echo "${#}"
echo "${@}"
echo "${*}"
# 2
# first-arg 2nd-arg
# first-arg 2nd-arg

# for <name> [in <list> ... ] ; do <commands>; done
# 
#  Executes commands for each member a list of items.
#  If `in <list> ...;` is not present, then `in "$@" is assumed.
#
for X in A B C; do echo "$X"; done;
for Y; do echo "$Y"; done;
for Y in "${*}"; do echo "$Y"; done;
# A
# B
# C
# first-arg
# 2nd-arg
# first-arg 2nd-arg
