# redirection:
# command > temp.log --> by default success output only stores here
# 1--> success
# 2--> failure
# &--> both
# should not run in shellscript folder
# run in centos user
# ls -ltr 2> temp.log
# ls -lllltgggey > temp.log
# cat temp.log
# ls -ltr &> temp.log
# ls -ltr 1> temp.log
# > --> replace for previous output
# >> --> append  
# ls -ltr &>> temp.log
# cat temp.log
# lfdsjkfhsn &>> temp.log
# cat temp.log
#script-name-<date>.log
#$0 --script name
# $1--- first argument
# $2--second argument
# $N--nth argument
# $@--all arguments
# $#--how many arguments
# $? exit status
# date +%F --to get correct format of date
# date +%F-%H --with hours
# date +%F-%H-%M --with minutes
# date +%F-%H-%M-%S--with seconds
# RED --\e[31m
# GREEN--\e[32m
# YELLOW--\e[33m
# NORMAL--\e[0m

#!/bin/bash
ID=$(id -u)
TimeStamp=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"
echo "script name: $0"
LogFile="/tmp/$0-$TimeStamp.log"
echo "Script stareted executing at $TimeStamp" $>> $LogFile

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "ERROR: $2 ...$R failed $N"
        exit 1
    else
        echo -e "$2 ...$G sucess $N"
    fi
}
if [ $ID -ne 0 ]
then 
    echo -e "$R ERROR:please run this script with root access $N"
    exit 1 #you can give other than zero
else
    echo "you are root user"
fi # fi means reverse of if indicating condition end

yum install mysql -y &>> $LogFile

VALIDATE $? "installing mysql"

yum install git -y &>> $LogFile

VALIDATE $? "installing git"

