#!/bin/bash

# Functions

# function <name> { <commands> ; }
#
# <name> () { <commands> ; }
#
#  built-in for creating sets of commands to be invoked by name.
#
#  Arguments on invocation are passed to the function as $1 .. $n.
#  Inside the script, $0 is the script file name, even within functions on the script.
#
#  Functions must be declared on top of scripts.
#
function first {
	echo "First: $1"
}
info() {
	echo "Info: $@"
}
first "test"
info "testing" "log"
# First: test
# Info: testing log

# local <name>=<value>
# 
#  Creates a function-local variable, with restricted scope to the function and its children.
#
MESSAGE="Global variable"
say() {
	local MESSAGE="${@}"
	echo "${MESSAGE}"
}
echo "${MESSAGE}"
say "Local" "variable"
# Global variable
# Local variable

# readonly <name>=<value>
# 
#  Marks a variable as read-only (constant).
#
# readonly -f <function-name>
#
#  Marks a function as read-only.
#
readonly RO_MSG="Read-only message"
try() {
	RO_MSG="${@}"
}
try "Mutating" "constant" >&1
# ./localusers/luser-demo10.sh: line 51: RO_MSG: readonly variable

# -f <file-path>
#
#  Checks if a file exists.
#
# basename <file-path>
#
#  Returns the file basename (striping directories in the path).
#
# /var/tmp
#
#  Temporary directory that is cleared on system boot.
#
# date +<format-options>
#
#  %F is full date
#
# cp -p <source> <destination>
#
#  -p preserves file metadata (timestamp, permissions, etc).
#
function backup_file {
	local FILE="${1}"

	if [[ -f "${FILE}" ]]
	then
		local BACKUP="/var/tmp/$(basename ${FILE}).$(date +%F)"
		info "Backing up ${FILE} to ${BACKUP}"
		cp -p ${FILE} ${BACKUP}

		cp ${FILE} "/var/tmp/$(basename ${FILE})"
	else
		return 1
	fi
}
backup_file "/etc/passwd"
ls -lah /var/tmp
# Info: Backing up /etc/passwd to /var/tmp/passwd.2019-03-19-N
# total 16
# drwxrwxrwt   4 root   wheel   128B Mar 19 09:18 .
# drwxr-xr-x  26 root   wheel   832B Jan 29 19:28 ..
# -rw-r--r--   1 josue  wheel   6.6K Mar 19 09:20 passwd
# -rw-r--r--   1 josue  wheel   6.6K Aug 17  2018 passwd.2019-03-19

