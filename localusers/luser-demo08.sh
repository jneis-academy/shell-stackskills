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
