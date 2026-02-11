#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo  -e "$2 is ...$R FAILED $N"
    else
        echo -e  "$2 is ...$G success $N "
    fi
}
CHECK_ROOT(){
     if [ $USERID -ne 0 ]
     then    
        echo "please run this script with preveleges"
        exit 1
     fi
}


CHECK_ROOT


for packages in $@ #@refres to all arguments passes to fi
do
    echo $packages
done