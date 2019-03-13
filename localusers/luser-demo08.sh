#!/bin/bash

# Advanced Standard Input, Standard Output, and Standard Error

# STDIN
#
#  Standard input, defaults to keyboard.
#  STDIN can be redirect from commands using |.
#  STDIN can also be redirect from files using <.
#
read LINE < /etc/paths
echo $LINE
# /usr/local/bin

# STDOUT
#
#  Standard output, defaults to console.
#  STDOUT can be redirect to files, using > (override) or >> (append).
#
head -n2 /etc/paths > tmp
cat tmp
rm tmp
# /usr/local/bin
# /usr/bin

# File descriptors
#
#  Numbers that represent open files.
#
#  By default, every new process starts with 3 opened file descriptors:
#
#   0 = STDIN
#   1 = STDOUT
#   2 = STDERR
#

read LINE < /etc/paths
read LINE 0< /etc/paths
echo $LINE
# /usr/local/bin

echo $RANDOM > tmp
echo "${RANDOM}" 1> tmp
cat tmp
rm tmp
# 28136

head -n1 fakefile 2> err.txt
cat err.txt
rm err.txt
# head: fakefile: No such file or directory

head -n1 /etc/paths fakefile > head.out 2>> head.err
head -n1 /etc/paths fakefile > head.out 2>> head.err
cat head.out head.err
rm head.out head.err
# ==> /etc/paths <==
# /usr/local/bin
# head: fakefile: No such file or directory
# head: fakefile: No such file or directory

# >&<file-descriptor>
#
#  Redirects to file descriptor.
#
# &>
#
#  Redirects both file descriptors 1 and 2.
#
head -n1 /etc/paths fakefile > head.log 2>&1
cat head.log
rm head.log
# head: fakefile: No such file or directory
# ==> /etc/paths <==
# /usr/local/bin
head -n1 /etc/paths fakefile &> head.log
cat head.log
rm head.log
# head: fakefile: No such file or directory
# ==> /etc/paths <==
# /usr/local/bin

# By default, STDERR does not flows through pipes.
#
# cat -n
#
#  -n prints out line numbers.
#
head -n1 /etc/paths fakefile | cat -n
# head: fakefile: No such file or directory
#      1	==> /etc/paths <==
#      2	/usr/local/bin
head -n1 /etc/paths fakefile 2>&1 | cat -n
#      1	head: fakefile: No such file or directory
#      2	==> /etc/paths <==
#      3	/usr/local/bin

# Normal output can be redirect to STDERR.
#
echo "Normal output sent to STDERR" >&2
# Normal output sent to STDERR

# /dev/null
# 
#  Null device.
#  Can be used for discarding output.
#  Useful for cleanup tasks (e.g. removing temporary files).
#
head -n1 /etc/paths fakefile 2> /dev/null
# ==> /etc/paths <==
# /usr/local/bin
