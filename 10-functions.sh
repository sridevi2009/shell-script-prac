# function --> code that is repaeated again, you can keep in function and call it whenever you want
# Function_Name(){
#     statement to run
# }
# VALIDATE(){
#     place here,repeated line of code
# }

# Function_Name --> calling name

#!/bin/bash
ID=$(id -u)
VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo "Installing Mysql is failed"
        exit 1
    else
        echo "Installing Mysql is sucess"
    fi
}
if [ $ID -ne 0 ]
then 
    echo "ERROR:please run this script with root access"
    exit 1 #you can give other than zero
else
    echo "you are root user"
fi # fi means reverse of if indicating condition end

yum install mysql -y
VALIDATE
yum install git -y
VALIDATE