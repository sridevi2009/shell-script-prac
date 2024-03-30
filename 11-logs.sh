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


#!/bin/bash
ID=$(id -u)
TimeStamp=$(date +%F-%H-%M-%S)
echo "script name: $0"
LogFile="/tmp/$0-$TimeStamp.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 ... failed"
        exit 1
    else
        echo "$2 ... is sucess"
    fi
}
if [ $ID -ne 0 ]
then 
    echo "ERROR:please run this script with root access"
    exit 1 #you can give other than zero
else
    echo "you are root user"
fi # fi means reverse of if indicating condition end

yum install mysql -y &>> $LogFile

VALIDATE $? "installing mysql"

yum install git -y &>> $LogFile

VALIDATE $? "installing git"

