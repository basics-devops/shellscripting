#!/bin/bash

# the task is to check the packages are installed or not. if not then install 
# with implementing functions.

#1. checking for the root user privilges.

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 package $R installation failed $N"  #Here, -e enables the interpretation of escape sequences.
    else
        echo -e  "$G successfully installed $N"
    fi
}

user_id=$(id -u)

if [ $user_id -ne 0 ] #if not zero then warn user to connect with root priviliges and exit the script.
then
    echo "please connect with root user access"
    exit 1
fi

# passing the packages names as variables.
#sh 14-loops.sh mysql git nginx

for i in $@ # this takes all the arguments passed to it.
do
    dnf list installed $i
    if [ $? -ne 0 ]
    then
        echo "$i package not installed.installing now"
        dnf install $i -y
        VALIDATE $? $i
    else 
        echo " $i package is already there. noting to do"
    fi
done

    
