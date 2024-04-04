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
SOURCE_DIR=/tmp/shellscript-logs
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d $SOURCE_DIR ] # ! denotes opposite
then
    echo -e "$R Source Directory: $SOURCE_DIR does not exist. $N"
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

while IFS= read -r line
do
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES_TO_DELETE


# delete old logs
# ===============
# 1.user has to provide source directory
# 2.action ---> archieve/delete
# 3. if he selects archieve --> where is the destination directory
# 4 time ---> optional, if he gives take it, otherwise 14 days default
# 5. memory --> optional. if he dont give dont consider, if he gives consider it....

# old-logs.sh -s <source-dir> -a <archieve/delete> -d <destination-dir> -t <no-days> -m <memory-in-mb>

# algorithm
# =========
# -s,-a,-d ---> check all these inputs, if he dont give tell him the usage...
# source directory exist or not
# destination directory exist or not

# -a ---> archieve if he dont give destination dir throw error about destination-dir

