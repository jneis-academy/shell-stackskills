#!/bin/bash

# Random data, cryptographic hash functions, text and string manipulation

# RANDOM
# 
#  bash built-in variable.
#  Generates a random integer between 0 and 32767 each time it is referenced.
#
echo "$RANDOM"
echo "${RANDOM}${RANDOM}${RANDOM}"
# 7488
# 389143429501

# date +<format>
#
#  Returns current date and time.
#  Output format includes: %s (epoch)
#  
#  > man strftime (documents output formats on MacOS)
#
echo $(date +%s)
# 1548283587

# sha256sum <stream>
#
#  Generates SHA checksums for a stream (file or pipe).
#
echo $(date +%s | sha256sum)
# 494140457a9dd639214e2c82908e64ba052d62bcf6611c1c0be1faa1b8d21010 -

# head -n<number> <stream>
#
#  Prints first lines of file or pipe.
#
# head -c<number> <stream>
#
#  Prints first characters of stream
#
echo $(date +%s | sha256sum | head -c8)
# 7524ff87

SPECIAL_CHARS='@#$%ˆ&()_-+='

# fold -w<number>
#
#  Wraps input lines to fit in specified width.
#
#  -w<number> breaks content into lines of <number> columns.
#
echo $(echo $SPECIAL_CHARS | fold -w1)
# @ # $ % ? ? & ( ) _ - + =

# sort -R
#
#  Writes a random permutation of input lines.
#
echo $(echo $SPECIAL_CHARS | fold -w1 | sort -R)
echo $(echo $SPECIAL_CHARS | fold -w1 | sort -R)
# @ % ( = $ _ ? & ) - # + ?
# # ) ( % - ? & @ + ? $ _ =

echo $(echo $SPECIAL_CHARS | fold -w1 | sort -R | head -c1)
# %

