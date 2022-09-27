#!/bin/bash

type -a getopts
# getopts is a shell builtin
# getopts is /usr/bin/getopts

help getopts
# getopts <opt> <var>
#   Parse positional parameters as options.
#   Returns 0 while options are found, 1 otherwise.
#   It does not change positional parameters, like 'shift'.
#
#   <opt> Option letters to be recognized. If a letter is followed by
#         a colon, the option is expected to have an argument.
#
#   <var> Holds the (current) option in $<var>.
#   OPTIND Holds the index of next positional argument to be processed (initialized to 1).
#   OPTARG Holds the argument value for the (current) option

function usage {
    echo "$0 [-ac] [-b VAL]"
    echo "Takes options from command line."
    echo "  -b VAL Option b with VAL argument"
    echo "  -a     Option a"
    echo "  -c     Option c"
    exit 1
}

while getopts ab:c OPTION
do
  case $OPTION in
    a) echo "Option a" ;;
    b) echo "Option b: $OPTARG" ;;
    c) echo "Option c" ;;
    ?) usage ;;
  esac
done

# > $0 -d 
# .$0: illegal option -- d

# > $0 -ac 
# Option a
# Option c

# > $0 -b
# .$0: option requires an argument -- b

# > $0 -bx
# Option b: x

echo "Number of args: $#"
echo "All args: $@"

# > $0 -ac -bx
# Option a
# Option c
# Option b: x
# Number of args: 3
# All args: -ac -b x
