#!/bin/bash

# prompt for user input
read -p 'Type something: ' THING
# Type something: 

echo $THING
# Something

# **** NOT SUPPORTED ON MACOS
# useradd
#    create or update user
#    requires sudo
#
# sudo useradd [options] <username>
#    -c, --comment       generally used for user's full name
#    -d --home-dir       user's home directory
#    -M --no-create-home no home directory is created

# passwd --stdin <username>
#    attach a password to user's login
# passwd -e <username>
#    expire a user's password, forcing password change

# su - [<username>]
#   su (switch user)
#   lets you switch the current user to any other user
#
#   'sudo su - '            change to root
#   'sudo su - <username>'  change to <username>
#   'sudo su -l <username>' change to <username>

# list running processes
ps -ef
# 501 91116 90590   0 22Aug22 ttys009    0:00.26 docker-compose up
# 501 91117 91116   0 22Aug22 ttys009    4:12.57 /usr/local/bin/docker-compose-v1 up
#   0 31486   976   0 Wed09AM ttys010    0:00.02 login -fp josue
# 501 31487 31486   0 Wed09AM ttys010    0:00.68 -bash
#   0 86180 31487   0  9:19AM ttys010    0:00.00 ps -ef

