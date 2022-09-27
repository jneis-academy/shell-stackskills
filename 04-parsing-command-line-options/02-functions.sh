#!/bin/bash

type -a function
# function is a shell keyword

help function
# function <name> { <commands> ; }
# <name> () { <commands> ; }
# 
#   create a shell function named <name>
#
#   when invoked as a simple command, the arguments are 
#   passed to the function as $1...$n
#
#   $FUNCNAME holds the function name

type -a local
# local is a shell builtin

help local
# local <name>[=<value>]...
#
#   define function-local variables;
#   they are visible only to the function where they
#   are defined and its children

type -a readonly
# readonly is a shell builtin

help readonly
# readonly [<name>[=<value>]...]
#   mark shell variables as unchangeable

type -a return
# return is a shell builtin

help return
# return [<n>]
#   return a numeric code from a shell function
#   if <n> is omitted, the return status is that
#   of the last command executed within the function
#   
# return should be used inside functions instead of
# exit (exit will cause the entire script to halt)

function log {
    local LVL="$1"
    shift
    local MSG="$@"
    echo "[$LVL] $MSG"

    if [["$?" -ne 0 ]]
    then 
        return 1
    fi
}

readonly INFO="info"
readonly DEBUG="debug"

INFO="trace"
# line 43: INFO: readonly variable

log $INFO "$@"
# [info] arg1 arg 2 arg 3
log $DEBUG "test"
# [debug] test
echo "$@"
# arg1 arg 2 arg 3

if [[ -z "$MSG" ]]; then echo "MSG is undefined"; fi
# MSG is undefined

type -a logger
# logger is /usr/bin/logger

# man logger
# make entries in the system log (syslog)
# 
#   logger [-is] [-f <file>] [-t <tag>] [<messages>...]
#     -i        add process id
#     -s        log to stderr AND syslog
#     -t <tag>  add tag

logger -is -t STACKSKILLS "This is a testing message"
# Sep  5 11:51:55  STACKSKILLS[37289] <Notice>: This is a testing message Testing log entry
