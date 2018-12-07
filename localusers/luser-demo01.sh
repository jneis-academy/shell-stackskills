#!/bin/bash

# This script displays various information to the screen.

# Display 'Hello'
echo 'Hello'

# Assign a value to a variable
WORD='script'

# Variable names can include letters, digits, and underscore
# Variable names can start with letters or underscore

# Display that value using the variable
echo "$WORD"

# Single quotes ignore variable interpolation
# Double quotes allow variable interpolation
echo '$WORD'

# Combine the variable with hard-coded text
echo "This is a shell $WORD"

# Display the contents of the variable using an alternative syntax
echo "This is a shell ${WORD}"

# Append text to the variable
echo "${WORD}ing is fun!"

# Show how NOT to append text to a variable
# This doesn't work
echo "$WORDing is fun"

# Variables can be named using lowercase
# However, naming conventions say uppercase

# Create a new variable
ENDING='ed'

# Combine the two variables
echo "This is ${WORD}${ENDING}"

# Change the value stored in the ENDING variable (reassignment)
ENDING='ing'
echo "${WORD}${ENDING} is fun!"

# Reassign value to ENDING
ENDING='s'
echo "You are going to write many ${WORD}${ENDING} in this class!"

