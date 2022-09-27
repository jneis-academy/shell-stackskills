#!/bin/bash

# user UID
echo "user $UID"
# user 501
echo "user $(id)"
# user uid=501(josue) gid=20(staff) groups=20(staff),12(everyone),80(admin)
echo "user `id -un`"
# user josue
echo "user $(whoami)"
# user josue

# if statements

type -a if
# if is a shell keyword

help if
# if <command>; then <commands>; [ elif <commands>; then <commands>; ]... [ else <commandds>; ] fi

type -a [[
# [[ is a shell keyword

help [[
# [[ <expr> ]]
#     Returns status 0 or 1.
#     Expressions are composed according to 'test' builtin.
#     Composition operators: (), !, &&, ||
#     
#     Comparision operators:
#     '==', '!='  Pattern matching, right operator is a pattern
#     '=~'        Regex, right operator is a regex

if [[ "$UID" -eq 0 ]]
then
  echo "Root user"
else
  echo "Not root"
fi

if [[ "$(id -u)" -eq 0 ]]; then echo "Root"; fi 

type -a test
# test is a shell builtin
# test is /bin/test

help test
# test <expr>
#    String operators:
#      -z <str> empty
#      -n <str> not empty
#    Other operators:
#      -o <option>        true if shell <option> is enabled
#      -v <var>           true if shell <var is set
#      <expr> -a <expr>   logical and
#      <expr> -o <expr>   logical or
#      <arg1> <op> <arg2> arithmetic tests
#                         <op> is -eq, -ne, -lt, -le, -gt, or -ge

# string conditional operators
if [[ -z "$UID" ]]; then echo "empty"; fi
if [[ -n "$UID" ]]; then echo "not empty"; fi
# not empty

# file conditional operators
if [[ -a "02-getting-started.sh" ]]; then echo "exists"; fi
if [[ -d ".." ]]; then echo "directory"; fi
# exists
# directory

