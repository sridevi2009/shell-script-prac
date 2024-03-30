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

ID=$(id -u)
if [ $ID -ne 0 ]
then 
    echo "please run this script with root access"
else
    echo "you are root user"
fi        