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

# yum list installed
# yum list installed git

#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
TimeStamp=$(date +%F-%H-%M-%S)
LogFile="/tmp/$0-$TimeStamp.log"

echo "Script Stareted Executing at $TimeStamp" &>> $LogFile

Validate() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .. $R Filed $N"
    else
        echo -e "$2 ..$G Success $N"
    fi        
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR: PLease run with root access $N"
    exit 1
else
    echo "you are root user"
fi

# echo "All arguments passed: $@"

for package in $@
do
    yum list installed $package  &>> $LogFile
    if [ $? -ne 0 ]
    then
        yum install $package -y  &> $LogFile
        Validate $? "Installation of $package"
    else
        echo -e "$Y $package: skipping ,already installed $N"
    fi        
done            
