#!/bin/bash

type -a cut
# cut is /usr/bin/cut

# man cut
#
# cut -b <list> [-n] [file ...]
# cut -c <list> [file ...]
# cut -f <list> [-w | -d delim] [-s] [file ...]
#
#  Cuts out selected portions of each line and writes them to stdout.
#  If no file arguments are specified, or a file argument is a single dash -, cut reads from stdin.
#  The items specified can be in terms of column position or in terms of fields delimited by a special character.
#  Column and field numbering start from 1.
#  
#  <list> is a comma or whitespace separated set of numbers and/or ranges.
#         Ranges consist of a number, a dash -, and a second inclusive number.
#         Ranges may be preceded by a dash, which selects all columns or fields from 1 to the last number.
#         Ranges may be followed by a dash, which selects all columns or fields from the last number to the end of the line.
#
#     -b <list>  Byte positions.
#     -c <list>  Character positions.
#     -f <list>  Field positions. Fields are delimited by tab (default), -d argument value or whitespace (-w option).
#     -d <delim> Use <delim> instead of tab (default).
#     -w         Use whitespace (spaces and tabs) as field delimiter. Consecutive whitespaces count as one single delimiter.
#

# man awk
#
# pattern-directed scanning and processing language
#
#  Scans input for lines matching patterns and execute actions on matched lines.
#
# awk [ -F <delim> ] [-v <var>=<value>...] ['<prog>' | -f <progfiles...>] [<input>...]
#
#  <prog> (or -f <profiles...>)
#     pattern-action statements

#  <pattern> {<action>} [; <pattern> {<action>}...]
#     missing pattern always matches
#     pattern-action statements are separated by newlines or semicolons
#
#  <action>
#     sequence of <statement>...
#
#  <statement>
#     if(<expr>) <statement> [else <statement>]
#     while(<expression>) statement
#     for(<expression>; <expression>; <expression>) <statement>
#     for(var in <array>) <statement>
#     do <statement> while(<expression>)
#     break
#     continue
#     {[<statement>...]}
#     <var>=<expression>
#     print [<expression>...] [> <expression>]
#     printf <format> [, <expression>...] [> <expression>]
#     return [<expression>]
#     next (skip remaining patterns on this input line)
#     nextfile (skip rest of this file, open next, start at top)
#     delete <array>[<expression>] (delete array element)
#  
#  <input>
#     file or stdin
#
#  -v <var>=<value>
#     assignments processed before <prog>
#
#  -F <delim>
#     input field separator regex (defaults to whitespace)
#     if <delim> is null, fields are single characters
#
#  Input lines are interpreted as field sets. Fields are denoted $1, $2..., while $0 refers to the entire line.
#
#  Special vars:
#     ARGC     argument count
#     ARGV     argument array
#     ENVIRON  array of env vars; subscripts are names
#     FILENAME name of current input file
#     FNR      number of current record in current file
#     FS       regex used to separate fields; settable by -F <delim>
#     NF       number of fields in current record
#     NR       number of current record
#     OFMT     output format for numbers (default %.6g)
#     OFS      output field separator (default space)
#     ORS      output record separator (default newline)
#     RS       input record separator (default newline; blank lines if empty, can be a regex)
#     RSTART   start position of matched string

echo 'Brian;Fox;began;coding;Bash' | cut -f -2,5 -d ';'
# Brian;Fox;Bash

echo 'Brian;Fox;began;coding;Bash' | awk -F ';' -v OFS=',' '{ print $1 OFS $2 OFS $5 }'
# Brian,Fox,Bash
