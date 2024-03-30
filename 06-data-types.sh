#!/bin/bash

Number1=$1
Number2=$2

sum=$(($Number1+$Number2))

echo "Total: $sum"
echo "how many arguments passed: $#"
echo "all arguments: $@"
echo "first argument: $1"
echo "secong argument: $2"
echo "nth argument: $N"
echo "script name: $0"
echo "exit status: $?"