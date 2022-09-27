#!/bin/bash

# sanity check with exit codes

TARGET_UID='1000'

if [[ "$UID" -eq "$TARGET_UID" ]]
then
  echo "Matched UID: $UID"
  exit 1
fi

# checking command (exit) statuses
# $? holds the status of last executed command

SUCCESS=$(exit 0)
if [[ "$?" -eq 0 ]]; then echo "Success"; fi
# Success

FAILURE=$(exit 2)
if [[ "$?" -ne 0 ]]; then echo "Failure"; fi
# Failure

INVALID_OPTION=$(id -x)
if [[ "$?" -ne 0 ]]; then echo "Invalid option 'x'"; fi
# id: illegal option -- x
# usage: id [user]
#        id -u [-nr] [user]
#        ...
# Invalid option 'x'


