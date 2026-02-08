#!/bin/bash

USERID=$(id -u)
# echo "User ID is: $USERID"

if  [ $USERID -ne 0 ]
then
    echo "Please run this script with root privaleges"
    exit 1
fi

dnf install mysql

if($? -ne 0)
then
    echo "MYSQL is not installed"
    dnf install mysql -y
    if [$? -ne 0 ]
    then
        echo "Mysql installation is failure...please check"
        exit 1
    else
        echo "Mysql installation is success"  
    fi  
else
    echo"Already isntalled,nothing to do"
fi