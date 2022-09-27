#!/bin/bash

# man bash - search for 'Arithmetic Expansion' and 'ARITHMETIC EVALUATION'
#
# Arithmetic Expansion
#   $((<expr>))
#
# ARITHMETIC EVALUATION
#   Operator precendence:
#     <var>++ <var>--                    post-increment/-decrement
#     - +                                unary
#     ++<var> --<var>                    pre-increment/-decrement
#     ! ~                                logical/bitwise negation
#     **                                 exponentiation
#     * / %                              multiplication, division, remainder
#     + -                                addition, subtraction
#     << >>                              left/right bitwise shifts
#     <= >= < >                          comparison
#     == !=                              equality and inequality
#     &                                  bitwise AND
#     ^                                  bitwise exclusive OR
#     |                                  bitwise OR
#     &&                                 logical AND
#     ||                                 logical OR
#     <expr>?<expr>:<expr>               conditional operator
#     = *= /= %= += -= <<= >>= &= ^= |=  assignment

echo $(1+2)
# line 5: 1+2: command not found

echo $((1+2))
# 3

A=1
echo "($A+2): $(($A+2))"
# (1+2): 3


type -a let
# let is a shell builtin

help let
# let <arg> [<arg>...]
#   Evaluate each <arg> as an arithmetic expression

let B=$A + 1
# line 46: let: +: syntax error: operand expected (error token is "+")

let C=$A+2 D=$C+1  # here C is not initialized yet, so 0
echo "C = $C"
# C = 3
echo "D = $D"
# D = 1


type -a expr
# expr is /bin/expr

# man expr
# 
# expr <expr>
#   Evaluate expression and writes results to stdout.
#   All operators/operands must be passed as separate arguments.

expr $C + 1
# 4

E=$(expr $C + 2)
echo $E
# 5
