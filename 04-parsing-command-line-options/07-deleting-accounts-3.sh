#!/bin/bash

# man tar
#
# tar -czf <archive> <file-or-dir> [<file-or-dir>...]
# tar -tvf <archive>
# tar -xvf <archive>
#
#  Creates and manipulates streaming archive files.
#  Extracts from tar, pax, cpio, zip, jar, ar, xar, rpm, 7-zip, and ISO 9660 cdrom images.
#  Creates tar, pax, cpio, ar, zip, 7-zip, and shar archives.
#
#     -c        Create a new archive containing the specified items
#     -r        Like -c, but new entries are appended to the archive.
#     -t        List archive contents to stdout.
#     -u        Like -r, but new entries are added only if they have a modification date newer than the corresponding entry in the archive.
#     -x        Extract to disk from the archive.
#     -f <file> Read from or write to <file> when extracting or archiving, respectively. <file> can be - for stdio or stdout.
#     -v        Verbose
#     -C <dir>  Read from or write to <dir> when archiving or extracting, respectively.
#     -z        Compression option for creating, describing or extracting archives.

# Create a test.tar.gz that contains files bash.man and files under directory structure of 02-user-account-creation
tar -cvf test.tar bash.man 02-user-account-creation
# a bash.man
# a 02-user-account-creation
# a 02-user-account-creation/02-getting-started.sh
# a 02-user-account-creation/04-exit-statuses.sh
# a 02-user-account-creation/03-special-variables.sh
# a 02-user-account-creation/05-reading-input.sh

ls
# 02-user-account-creation   04-parsing-command-line-options bash.man
# 03-password-generation     README.md                       test.tar.gz

# Display a table of contents for test.tar.gz
tar -tvf test.tar.gz
# -rw-r--r--  0 josue  staff  382019 Sep  9 09:16 bash.man
# drwxr-xr-x  0 josue  staff       0 Aug 30 08:59 02-user-account-creation/
# -rwxr-xr-x  0 josue  staff     901 Sep  2 09:17 02-user-account-creation/02-getting-started.sh
# -rwxr-xr-x  0 josue  staff     563 Sep  2 09:45 02-user-account-creation/04-exit-statuses.sh
# -rwxr-xr-x  0 josue  staff    1604 Sep  2 09:44 02-user-account-creation/03-special-variables.sh
# -rwxr-xr-x  0 josue  staff    1149 Sep 23 10:23 02-user-account-creation/05-reading-input.sh


# Extract all entries from the archive on current directory
# tar -xvf test.tar.gz

# Extract all entries from the archive on temp directory
mkdir temp
tar -xvf test.tar.gz -C temp
# x bash.man
# x 02-user-account-creation/
# x 02-user-account-creation/02-getting-started.sh
# x 02-user-account-creation/04-exit-statuses.sh
# x 02-user-account-creation/03-special-variables.sh
# x 02-user-account-creation/05-reading-input.sh

