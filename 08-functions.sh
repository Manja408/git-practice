#!/bin/bash

USERID= $(id -u)

VALIDATE(){
    if [ $1 -ne 0]
    then 
        echo "$2 is ...FAILED"
    else
        echo "$3 is ...success"
    fi
}

if [  $USERID -ne 0 ]
then    
    echo "please run this script with preveleges"
    exit 1
fi

dnf list installed git

if [$? -ne 0]
then
    echo "MYSQL is not installed....going to install"
    dnf install git -y
    VALIDATE $? "installing Mysql"
else
    echo "Already isntalled,nothing to do"
fi

dnf list installed mysql

if [$? -ne 0]
then
    echo "MYSQL is not installed....going to install"
    dnf install mysql -y
    VALIDATE $? "installing Mysql"
else
    echo "Already isntalled,nothing to do"
fi