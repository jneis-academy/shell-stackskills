#!/bin/bash

# Random data, cryptographic hash functions, text and string manipulation

# Random numbers
#
#  > man bash
#    /RANDOM
#
echo "$RANDOM"
echo "${RANDOM}${RANDOM}${RANDOM}"

# Current date/time
#
#  > man date
#  > man strftime
#
# strftime command formats date and time
#   (man page docs formats)
#
#  date + (custom output format)
#  %s (epoch)
#  #N (nanoseconds)
echo $(date +%s)
echo $(date +%s%N)

# Checksum (SHA256)
#
#  > man sha256sum
#  > man head
#
# head command outputs first lines of files
#
#  sha256sum file
#  <some-output> | sha256sum
#
#  head -nX file (prints X first lines of file)
#  <some-output> | head -cX (prints X first chars)
# 
echo $(date +%s | sha256sum | head -c8)

# Random special chars 
#
#  > man shuf
#  > man fold
#
# shuf command writes a random permutation of input lines
# 
# fold command wrap input lines to fit in specified width
#
#  <some-output> | fold -w1 (breaks content into lines of 1 column)
#
SPECIAL_CHARS='!@#$%ˆ&*()_-+='
echo $(echo $SPECIAL_CHARS | fold -w1 | shuf | head -c1)

