#!/bin/bash

# man bash - search for 'Shell variables'
#   $RANDOM random integer between 0 and 32767

# man date
#   display or set date and time

date
# Wed Aug 31 09:11:03 -03 2022

# Timezone
TZ=America/Los_Angeles date
# Wed Aug 31 05:11:03 PDT 2022

# ISO 8601
date -Iseconds
# 2022-08-31T09:10:53-03:00

# UTC
date -Iseconds -u
# 2022-08-31T12:10:55+00:00

# Formatting
date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"
# DATE: 2022-08-31
# TIME: 09:25:35

date "+%Y-%m-%d %H:%M:%S %z"
# 2022-08-31 09:31:54 -0300

# date formatting
#    %a locale's abbreviated weekday name (e.g., Sun)
#    %A locale's full weekday name (e.g., Sunday)
#    %b locale's abbreviated month name (e.g., Jan)
#    %B locale's full month name (e.g., January)
#    %H hour (00..23)
#    %I hour (01..12)
#    %p locale's equivalent of either AM or PM; blank if not known
#    %c locale's date and time (e.g., Thu Mar  3 23:05:25 2005)
#    %s seconds since 1970-01-01 00:00:00 UTC
#    %n a newline

# man sha1sum
# man sha256sum
# man sha512sum
#   compute SHA checksums
#   shaXsum [option] <input>
#     -b, --binary read in binary mode

sha1sum README.md
# 70c95caa79e9c2e14d02cf335aff7d73b2700c4e  README.md

echo "123" | sha1sum
# a8fdc205a9f19cc1c7507a60c4f01b13d11d7fd0  -

echo "123" | sha256sum
# 181210f8f9c779c26da1d9b2075bde0127302ee0e3fca38c9a83f5b1dd8e5d3b  -

date +%s | sha512sum
# bf2421f1fea3ec25a538717de70aacb24076bb29e65004378413a92e578f8191cf0ae1e818ab1bc355a5c4fa10949555650cb2302350bfcfe1b91bd5ac443f7c  -

# man head
# display first lines or bytes of input
# head [-n <lines> | -c <bytes>] <input>

date +%s | sha1sum | head -c 20
# 40c07f312681d49d4ac3

man shuf
# shuf - generate random permutations
#   shuf [-n <lines>] <input>

shuf README.md -n 1
# #### Reading input
shuf README.md -n 1
# `man <command> | col -bx > command.txt`

man fold
# fold - fold long lines for finite width output device
#   fold [-w <width>] <input>

SPECIAL_CHARS='!@#%&*-_=?<>'

echo $SPECIAL_CHARS | fold -w 3
# !@#
# %&*
# -_=
# ?<>

HASH=$(date +%s$RANDOM | sha1sum | head -c14)
SPECIAL_CHAR=$(echo $SPECIAL_CHARS | fold -w1 | shuf | head -c1)
PASSWORD="$HASH$SPECIAL_CHAR"

echo $PASSWORD
