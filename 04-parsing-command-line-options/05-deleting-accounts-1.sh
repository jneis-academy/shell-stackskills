#!/bin/bash

type -a locate
# locate is /usr/bin/locate

# man locate
#
# locate [-l <l>] <pattern>...
#
#  Search the file system database for pathnames matching the specified <pattern>.
#  The database is recomputed periodically.
#  Globbing/quoting characters * ? \ [ ] can be used.
#  Preceding chars with \ eliminates special meaning.
#  A <pattern> containing no globbing characters is matched as it were "*<pattern>*".
#
#     -i     Ignore case distinctions in <pattern>.
#     -l <l> Limit output to number of file names.

locate 04-parsing
# /Users/josue/workspace/studies/stackskills-bash/04-parsing-command-line-options
# /Users/josue/workspace/studies/stackskills-bash/04-parsing-command-line-options/01-case-statements.sh
# /Users/josue/workspace/studies/stackskills-bash/04-parsing-command-line-options/02-functions.sh
# /Users/josue/workspace/studies/stackskills-bash/04-parsing-command-line-options/03-parsing-part-1.sh
# /Users/josue/workspace/studies/stackskills-bash/04-parsing-command-line-options/04-parsing-part-2.sh
# /Users/josue/workspace/studies/stackskills-bash/04-parsing-command-line-options/05-deleting-accounts-1.sh

locate "*04-parsing-command-line-option?"
# /Users/josue/workspace/studies/stackskills-bash/04-parsing-command-line-options

locate -l 3 "*04-parsing*"
# /Users/josue/workspace/studies/stackskills-bash/04-parsing-command-line-options
# /Users/josue/workspace/studies/stackskills-bash/04-parsing-command-line-options/01-case-statements.sh
# /Users/josue/workspace/studies/stackskills-bash/04-parsing-command-line-options/02-functions.sh
# locate: [show only 3 lines]

locate 04-parsing | grep 05
# /Users/josue/workspace/studies/stackskills-bash/04-parsing-command-line-options/05-deleting-accounts-1.sh

type -a grep
# grep is /usr/bin/grep

# man grep
#
# grep [-cEHIimnoRsSsvw] 
#      [-A <lines>] [-B <lines>] [-C[lines]] 
#      [--exclude <pattern>] [--exclude-dir <pattern>]
#      [-f <file>]
#      [<pattern>] [<input|file>...]
#
#  Search given <input>, selecting lines that match given <pattern>.
#
#   -A <lines>              Print <lines> of trailing context after each match.
#   -B <lines>              Print <lines> of leading context before each match.
#   -C <lines>              Print <lines> of leading and trailing context surrounding each match.
#   -c                      Print ONLY the count of lines matched (does not print actual matches).
#   -E                      Interpret pattern as extended regular expression.
#   --exclude <pattern>     Exclude files matching the given pattern from the search.
#   --exclude-dir <pattern> Excludes directories matching the given pattern from the search.
#   -f <file>               Use patterns specified in the given <file>.
#   -H                      Print filename with output lines.
#   -I                      Ignore binary files.
#   -i                      Perform case insensitive matching (defaults to case sensitive).
#   -m <num>                Stop reading after <num> matches.
#   -n                      Print line numbers.
#   -o                      Prints only matching parts of lines.
#   -R -r                   Recursively search subdirectories.
#   -S                      Follow all symlinks (defaults not to).
#   -s                      Silent error mode: ignore nonexistent and unreadable files.
#   -v                      Select lines not matching the given <pattern>.
#   -w                      Search for complete words (as if surrounded by "[[:<:]]" and "[[:>:]]")
#
#  Exit status:
#   0  One/more lines selected.
#   1  No lines selected.
#   >1 Error

# Find first two occurrences of 'allow' in a file:
grep -n allow -m 2 bash.man
# 47:                 input.  This option allows the positional  parameters  to  be
# 142:       bash is interactive, allowing a shell script or a startup file to  test

# Same as above but looking only for complete words:
grep -n -w allow -m 2 bash.man
# 206:       those options or allow them to be specified.
# 578:       shell without the interactive_comments option enabled  does  not  allow

# Count occurrences of 'allow' in two files:
grep -n -c -H allow bash.man README.md
# bash.man:44
# README.md:0

# Find matches for extended regular expression patterns read from the stdin:
echo -e 'allow\ninteractive' | grep -E -n -m 2 -f - bash.man
# 40:       -i        If the -i option is present, the shell is interactive.
# 47:                 input.  This option allows the positional  parameters  to  be

