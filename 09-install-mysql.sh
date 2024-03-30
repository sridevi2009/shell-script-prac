#!/bin/bash
# 1 check user is root or not
# 2. if user is root proceed, if not root stop and send error, run with root user.
# 3. if root
#     proceed
#    if not root
#     stop and say run with root acess
# 4. now intall mysql
# 5. check installed properly or not
# 6. if sucess
#     then good
#    not sucess
#     show what is the error 

# if root user "id" will be always "0"
# exit status= previous command success or not
# $? --if success, it shows "0", if failure not "0"
# echo $?
 
ID=$(id -u)
if [ $ID -ne 0 ]
then 
    echo "ERROR:please run this script with root access"
    exit 1 #you can give other than zero
else
    echo "you are root user"
fi # fi means reverse of if indicating condition end

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "Installing Mysql is failed"
    exit 1
else
    echo "Installing Mysql is sucess"
fi        