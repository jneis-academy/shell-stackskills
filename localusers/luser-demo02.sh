#!/bin/bash

# Display the UID and username of the user executing this script
# Display if the user is the root or not

# Display the UID
echo "Your UID is ${UID}"
echo "Your EUID is ${EUID}"

# EUID is almost always equal to UID
# Some bashes allow scripts to set UID (usually read-only)
# In such cases, UID and EUID would differ

# Using builtin id
id
id -u
id -n # id: cannot print only names or real IDs in default format
id -u -n

# Using builtin whoami (same as id -un)
whoami

# Display the username
USER_NAME=$(id -un)
echo "Your username is $USER_NAME"

# Old syntax for command expressions
USER_NAME=`id -un`
echo "Again, your username is $USER_NAME"

# Display if the user is root (root is always id 0)
if [[ "${UID}" -eq 0 ]]
then
  echo 'You are root'
else
  echo 'You are not root'
fi

# If statements
# - if keyword must be followed by a space
# - condition is enclosed in double brackets
# - opening brackets must be followed by a space
# - closing brackets must be preceeded by a space
# - variables referenced inside condition must be enclosed in double quotes

# New-line characters are command separators
# Alternatively, semi-colons can be used as command separators for one-line, multi commands
if [[ "${UID}" -eq 0 ]]; then echo 'You are root'; fi

# [[ is a builtin command
# It executes a conditional command
# Returns a status of 0 or 1 depending on the evaluation of the conditional expression inside it
# Double brackets are new syntax for old single brackets [

