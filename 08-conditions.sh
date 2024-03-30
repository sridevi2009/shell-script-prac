#!/bin/bash
#example problem
#if(today != "sunday") {
#     print "go to school"
# }
# else {
#     print " happy Holiday"
# }

# 20
# if 20 is greater than 100 then print, given number is greater than 20 otherwise print less than 100
# $Number > 100
# $Number -gt 100
# $Number -lt 100
# $Number -ge 100
# $Number -le 100


Number=$1
if [$Number -gt 100]
then 
    echo "given $Number is greater than 100"

else 
    echo "given $Number is less than 100"
fi 