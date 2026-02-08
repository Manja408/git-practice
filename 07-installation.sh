#!/bin/bash

USERID=$(id -u)
# echo "User ID is: $USERID"

if  [ $USERID -ne 0 ]
then
    echo "Please run this script with root privaleges"
    exit 1
fi

dnf install mysqld

if($? -ne 0)
then
    echo "MYSQL is not installed"
    dnf install mysqld
else
    echo"Already isntalled,nothing to do"
fi