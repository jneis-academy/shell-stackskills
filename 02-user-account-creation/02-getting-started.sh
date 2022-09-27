#!/bin/bash

type -a bash
# bash is /usr/local/bin/bash
# bash is /bin/bash

which bash
# /usr/local/bin/bash

type -a echo
# echo is a shell builtin
# echo is /bin/echo

type -a if
# if is a shell keyword

# docs for shell built-in
help echo

# docs for shell keyword
help if

# docs for general commands/scripts
man bash
bash --help

# help/man page to text file
man bash | col -bx > bash.man

# man bash - search for 'Shell Variables'
#   ...
#   HOME The home directory of the current user
#   PATH The search path for commands

# execution permissions

ls -lah
# drwxr-xr-x  4 josue  staff   128B Aug 24 08:57 .
# drwxr-xr-x  5 josue  staff   160B Aug 24 08:56 ..
# -rwxr-xr-x  1 josue  staff   229B Aug 24 09:00 02-getting-started.sh

# r = 4
# w = 2
# x = 1

# owner - group - others
# 600 = (4+2)00 = owner read+write, group none, others none

touch test.sh
chmod 755 test.sh
chmod +x test.sh
