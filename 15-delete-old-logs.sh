# delete old log files
# disk usage and alert

# 1. we have a folder where we are storing log files
# /tmp/shell-script-logs

# 2.delete log files more than 14 days only .log extensions not another files

# source-directory
# search .log files and more than 14 days old
# rm -rf 
# mkdir /tmp/shellscript.log
# cd /tmp/shellscript.log
# touch -d 20240101 user.log
# touch -d 20240401 catalogue.js
# touch -d 20240325 shipping.java
# touch -d 20240301 cart.log
# touch -d 20240122 user.js
# ls -l
# find . -type f
# find . -type f -mtime +14
# find . -type f -mtime +14 -name "*.log"

#!/bin/bash
SOURCE_DIR=/tmp/shellscript.logs
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d $SOURCE_DIR ] # ! denotes opposite
then
    echo -e "$R Source Directory: $SOURCE_DIR does not exist. $N"
fi

FILES_TO_DELETE=$(find . -type f -mtime +14 -name "*.log")

while IFS= read -r line
do
    echo "Deleting file: $line"
done <<< $FILES_TO_DELETE


