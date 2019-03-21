#!/bin/bash

# Parsing Command Line Options with getopts, Part 2

# (( <arithmetic-expression> ))
#
#  Arithmatic expansion.
#
NUMBER1=6
NUMBER2=4
NUMBER=$(( NUMBER1 / NUMBER2 ))
echo "${NUMBER}"
# 1

# bc -l
#
#  /usr/bin/bc
#
#  Precision calculator library.
#  Accepts standard input.
#
#   -l uses standard math library.
#
echo $(echo '6 / 4' | bc -l)
# 1.50000000000000000000

# let <arithmetic-expression>
#
#  Evaluates arithmetic expressions too.
#
let NUMBER='NUMBER1++'
echo "${NUMBER} ${NUMBER1}"
# 6 7

# expr <expression>
#
#  /bin/expr
#
#  Evaluates expressions as well.
#
NUMBER=$(expr $NUMBER2 + 1)
echo "${NUMBER}"
# 5

# Arithmetic expressions application:
#
#  getopts does not remove positional parameters, so a arithmetic expression
#  can be used for shifting positional parameters based on the last option index.
#
#  $OPTIND stores the next argument's index to be processed.
#  After processing all options, $OPTIND will indicate the number of arguments +1 that
#   correspond to options handled by getopts.
#  
while getopts abc: OPTION
do
  echo "Option ${OPTION} ${OPTARG}"
done
echo "All args (${#}): ${@}"
echo "Args that are options: $(( OPTIND - 1 ))"
shift "$(( OPTIND - 1 ))"
echo "Args that are not options: ${@}"

# $ ./localusers/ss44-g.sh -abc ARGC
# Option a 
# Option b 
# Option c ARGC
# All args (2): -abc ARGC
# Args that are options: 2
# Args that are not options: 

# $ ./localusers/ss44-g.sh -acb ARGC
# Option a 
# Option c b
# All args (2): -acb ARGC
# Args that are options: 1
# Args that are not options: ARGC

# $ ./localusers/ss44-g.sh -c ARGC test
# Option c ARGC
# All args (3): -c ARGC test
# Args that are options: 2
# Args that are not options: test
