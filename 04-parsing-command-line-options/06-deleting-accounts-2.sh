#!/bin/bash

# **** NOT SUPPORTED ON MACOS
# userdel
#    delete user
#    -r deletes user's home directory
#
# $ tail /etc/passwd
# joedoe:x:1001:1001:Joe Doe:/home/joedoe:/bin/bash
# maryd:x:1002:1002:Mary Doe:/home/maryd:/bin/bash
#
# $ id -u joedoe
# 1001
#
# $ ls -l /home
# total 0
# drwxrwxrwt   17 root   wheel  544  Sep 9 13:27 Shared
# drwxr-xr-x@ 107 joedoe staff 3424  Dec 1 18:42 joedoe
# drwxr-xr-x@ 107 maryd  staff 3424  Dec 1 18:42 maryd
#
# $ sudo userdel joedoe
# 
# $ id joedoe
# id: joedoe: no such user
#
# $ ls -l /home
# total 0
# drwxrwxrwt   17 root wheel 544  Sep 9 13:27 Shared
# drwxr-xr-x@ 107 1001 1001  3424 Dec 1 18:42 joedoe
# drwxr-xr-x@ 107 maryd  staff 3424  Dec 1 18:42 maryd
#
# $ sudo userdel -r maryd
# 
# $ ls -l /home
# total 0
# drwxrwxrwt   17 root wheel 544  Sep 9 13:27 Shared
# drwxr-xr-x@ 107 1001 1001  3424 Dec 1 18:42 joedoe
#
