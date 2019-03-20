#!/bin/bash

# Parsing Command Line Options with getopts, Part 1

# getopts <optstring> <name>
#
#  Built-in command that parse positional parameters.
#
#   <optstring> contains the option letters to be recognized.
#   A following colon on <optstring> indicates the option expects an argument (which is place into OPTARG variable).
#   <name> defines the variable which will be initialized.

function usage {
	echo "Usage: ${0} [-vs] [-l LENGTH]" >&2
	echo "Generate a random string"
	echo "  -l LENGTH  Specify the string length"
	echo "  -s         Append a special character"
	echo "  -v         Use verbose mode"
	exit 1
}

function log {
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = "true" ]]
	then
		echo "${MESSAGE}"
	fi
}

while getopts vl:s OPTION
do
	case ${OPTION} in
		(v)
			VERBOSE="true"
			log "Verbose mode on"
			;;
		(l)
			LENGTH="${OPTARG}"
			log "Length is ${LENGTH}"
			;;
		(s)
			USE_SPECIAL_CHARS="true"
			log "Appending a special character"
			;;
		(?) usage ;;
	esac
done
#
# $ ./localusers/ss43-getopts.sh -v
# Verbose mode on
#
# $ ./localusers/ss43-getopts.sh -vs
# Verbose mode on
# Using special characters
#
# $ ./localusers/ss43-getopts.sh -vl
# Verbose mode on
# ./localusers/ss43-getopts.sh: option requires an argument -- l
# Invalid option
#
# $ ./localusers/ss43-getopts.sh -vm
# Verbose mode on
# ./localusers/ss43-getopts.sh: illegal option -- m
# Usage: ./localusers/ss43-getopts.sh [-vs] [-l LENGTH]
# Generate a random string
#  -l LENGTH  Specify the string length
#  -s         Include special characters
#  -v         Use verbose mode

log "Generating a random string"
 
GENERATED_VALUE="$(date +%s${RANDOM}${RANDOM} | sha1sum | head -c${LENGTH})"

if [[ "${USE_SPECIAL_CHARS}" = "true" ]]
then
	log "Selecting a random special character"
	SPECIAL_CHAR=$(echo "@#$%^&*()-+=" | fold -w1 | sort -R | head -c1)
	GENERATED_VALUE="${GENERATED_VALUE}${SPECIAL_CHAR}"
fi

log "Done"
echo "${GENERATED_VALUE}"

exit 0

# $ ./localusers/ss43-getopts.sh -l 12 -vs
# Verbose mode on
# Appending a special character
# Generating a random string
# Selecting a random special character
# Done
# 3b073912fc5f%


