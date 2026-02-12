#!/bin/bash

LOGS_FOLDER="/var/log/shell-script/"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo  -e "$2 is ...$R FAILED $N" &>>$LOG_FILE
    else
        echo -e  "$2 is ...$G success $N " &>>$LOG_FILE
    fi
}
CHECK_ROOT(){
     if [ $USERID -ne 0 ]
     then    
        echo -e "$R please run this script with preveleges $N" &>>$LOG_FILE
        exit 1
     fi
}


CHECK_ROOT


for package in $@ #@refres to all arguments passes to fi
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ] 
    then
        echo "$package is not inatalled,going to install it.." &>>$LOG_FILE
    dnf install $package -y
    VALIDATE $? "installing $package"
    else
        echo "$package is already installed..nothing to do" &>>$LOG_FILE
    fi
done
