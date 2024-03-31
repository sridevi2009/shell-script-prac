# sh 13-install-packages.sh git mysql gcc postfix wget net-tools
# $#--no og args
# $0--script-name
# $@--all arguments

# 1.check root user or not
# 2.if root user 
#     check packages is already installed or not
#         if installed skip it and tell user, laready installed
#         if not installed, install it
#         validate it
#     if not root user
#         throw the error   

#!/bin/bash
ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR: PLease run with root access $N"
    exit 1
else
    echo "you are root user"
fi

echo "All arguments passed: $@"       
