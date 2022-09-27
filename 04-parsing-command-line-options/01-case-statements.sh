#!/bin/bash

help case
# case <value> in [<pattern> [| <pattern>...]) <commands> ;;]... esac
#    execute commands based on pattern matching

# man bash - search for 'Pattern Matching'

# Pattern matching:
#   general characters match themselves (e.g. a=a, b=b, 1=1, etc)
#
#   special characters:
#     \     escape (discarded when matching)
#     ?     any single character
#     *     any string, including null
#     **    all files and any directories and subdirectories
#     **/   only directories and subdirectories
#     [abc] any of the enclosed characters
#     [a-c] any characters within indicated range
#     [!ab] any character NOT enclosed  
#     [^ab] any character NOT enclosed  
#
#   pattern lists:
#     ([a-c]|1) one or more patterns separated by |
#     Composition:
#       ?() matches zero or one
#       *() matches zero or more
#       +() matches one or more
#       @() matches one
#       !() matches anything except one

case "$1" in
  start|--start)
    echo "Starting"
    ;;
  stop|--stop)
    echo "Stopping" ;;
  status|--status) echo "Status" ;;
  *)
    echo "Wrong option"
    exit 1
    ;;
esac
