#!/bin/bash

# This script creates an account on the local system
# You will be prompted for the account name and password

# Ask for the username
read -p 'Enter the username to create: ' USERNAME

# Ask for the real name
read -p 'Enter the name of the person who this account is for: ' COMMENT

# Ask for the password
read -p 'Enter the password to use for the account: ' PASSWORD

# Create the user
useradd -c "$COMMENT" -m $USERNAME

# useradd -c option enables to add a description to the user created
# useradd -m option enforce creating the new user a home folder
# home folder creation default behavior is determined by CREATE_HOME variable
# CREATE_HOME variable is usually set at /etc/login.defs file

# Set the password for the user
echo $PASSWORD | passwd --stdin $USERNAME

# --stdin uses the input from stdin
# -e expires password at first login

# Force password change on first login
passwd $USERNAME -e

