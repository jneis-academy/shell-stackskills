#!/bin/bash


# Only display if the UID does NOT match 0
UID_TO_TEST_FOR=0

# exit [<status>]
#
#  Exits the shell.
#  If exit status is ommited, 
#    status of the last command executed is used.
# 
#  0 = success

if [[ $UID -ne $UID_TO_TEST_FOR ]]
then
  echo "Your UID does not match $UID_TO_TEST_FOR"
  exit 1
fi

USER_NAME=$(id -un)

# ?
#
#  Shell built-in variable.
#  Holds the exit status of the last executed command.

echo ?
# ?
echo $?
# 0

if [[ $? -ne 0 ]]
then
  echo 'The id command did not execute successfully'
  exit 1
fi

USER_NAME_TO_TEST_FOR=root

# =
#
#  Assignment AND conditional operator.
#
#  = test for exact match.
#
#  == test for pattern match.
#    The string to the right of the operator is used as a pattern.

if [[ "$USER_NAME" = "$USER_NAME_TO_TEST_FOR" ]]
then
  echo "Your username matches $USER_NAME_TO_TEST_FOR"
fi
# Your username matches root

if [[ $USER_NAME != $USER_NAME_TO_TEST_FOR ]] 
then
  echo "Your username does not match ${USER_NAME_TO_TEST_FOR}"
  exit 1
fi

exit 0
