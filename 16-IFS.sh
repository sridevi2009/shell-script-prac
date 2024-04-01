#!/bin/bash
file=/etc/passwd
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f $file ]
then
    echo -e "$R Source Directory: $file does not exist $N"
fi

while IFS=":" read -r username password user_id group_id user_fullname home
do
    echo "username: $username"
    echo "user ID: $user_id
    echo "user_fullname: $user_fullname

done < $file