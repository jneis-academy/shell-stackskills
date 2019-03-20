#!/bin/bash

# Reading standard input, creating accounts, username conventions, more quoting.

# read -p <prompt-message> <variable>
#
#  Reads a line from stdin into a variable.
#
#  -p <message> prompts the input with a message.

read -p 'Enter the username to create: ' USERNAME
# Enter the username to create: 
# Enter the username to create: doe

read -p 'Enter the name of the person who this account is for: ' COMMENT
# Enter the name of the person who this account is for: 
# Enter the name of the person who this account is for: John Doe

read -p 'Enter the password to use for the account: ' PASSWORD
# Enter the password to use for the account: 
# Enter the password to use for the account: doe123

# useradd -c <comment> -m <home-folder>
#
#  Creates a local user.
#
#  -c adds a description to the new user.
#  -m creates a home folder for the user.

useradd -c "$COMMENT" -m $USERNAME

# su <username>
#
#  Substitutes current user.
#
# su - <username>
#
#  Substitutes current user and moves to target user environment
#    (home folder, bash history, etc.).
#
# su -
#
#  Substitutes current user for root.
#
# E.g.
#
#  $ su doe
#  $ whoami
#  doe
#  $ exit
#  $ whoami
#  root

# passwd --stdin <username> 
#
#  Modifies a user password.
#
#  --stdin password should be read from stdin, which can be a pipe

# <command> | <command>
#
#  Pipe (command pipeline).
#  Takes stdout from first command and passes into sdtin of second command.
#  stderr from first command is NOT passed into second command.

echo $PASSWORD | passwd --stdin $USERNAME
# Changing password for user doe.
# passwd: all authentication tokens updated successfully.

# passwd <username> -e
#
#  Expires a user's password on first login

passwd $USERNAME -e
# Expiring password for user doe.
# passwd: Success
#
# E.g.
#
#  $ su jim
#  $ whoami
#  jim
#  $ su doe
#  Password: 
#  Password: doe123
#  You are required to change your password immediately (root enforced)
#  Changing password for doe.
#  (current) UNIX password:
#  (current) UNIX password: doe123
#  New password: 
#  New password: 4567890john
#  Retype new password: 
#  Retype new password: 4567890john

