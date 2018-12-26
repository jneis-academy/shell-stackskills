#!/bin/bash

# Enforce that this script is executed with root privileges
# If it is not, it returs exit status 1
if [[ "$UID" -ne 0 ]]
then
  echo "Not enough privileges"
  exit 1
fi
# REVIEW:
# - UID is a built-in variable
# - -ne is a built-in conditional operator 

# Prompts for username, real name, and initial password
read -p "Username: " USERNAME
read -p "Real name: " REALNAME
read -p "Password: " PASSWORD
# REVIEW:
# - read -p is the built-in command (with -p argument) to read prompt

# Creates the new user with the input provided
useradd -c "$REALNAME" -m $USERNAME
# REVIEW: 
# - useradd is the built-in command to create users
# - -c argument allows to pass a comment (description)
# - -m argument enables user's home folder creation

# Informs the user if the account was not able to be created, for some reason
# If the account is not created, it returns exit status 1
# (Check to see if useradd command succeeded)
if [[ "${?}" -ne 0 ]]
then
  echo "Could not create user"
  exit 1
fi 

echo "$PASSWORD" | passwd --stdin ${USERNAME}
# REVIEW:
# - password are set programmatically by echoing variables and 
#   piping them into passwd command, with --stdin argument

if [[ "${?}" -ne 0 ]]
then
  echo "Could not set the user password"
  exit 1
fi

# Force password change on first login
passwd -e $USERNAME
# REVIEW:
# - -e argument expires a user password

# Displays the username, password and the host where user was created
echo 
echo "Username: $USERNAME"
echo "Password: $PASSWORD"
echo "Hostname: $HOSTNAME"

