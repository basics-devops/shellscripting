#!/bin/bash

# the task is to check the packages are installed or not. if not then install 
# with implementing functions.

#1. checking for the root user privilges.

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo "$2 package installation failed"
    else
        echo "successfully installed"
    fi
}

user_id=$(id -u)

if [ $user_id -ne 0 ] #if not zero then warn user to connect with root priviliges and exit the script.
then
    echo "please connect with root user access"
    exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "package is not installed"
    VALIDATE $? "mysql"
else
    echo "mysql is already installed skipping this"
fi

dnf list installed ansible
if [ $? -ne 0 ]
then
    echo "package is not installed"
    dnf install ansible
    VALIDATE $? "ansible"
else
    echo "ansible is already installed skipping this"
fi

