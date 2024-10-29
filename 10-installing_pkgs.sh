#!/bin/bash

#goal - 1. install mysql-server 
#2. enable service and start service.
#3.setup root password. (if already present skip/ or create if not.)
#mainly to install packages we need sudo privileges. Root user will have sudo access.

user_id=$(id -u)

if [ $user_id -ne 0 ]  #0 means root 
then
    echo "please connect with root user"  # other than 1 it is not a root user.
    exit 1                               # exit here.
fi

dnf list installed mysql-server  # list if it already installed , if installed return exit code 0

if [ $? -ne 0 ]  # if the exit code is not zero then , it will install
then
    dnf install mysql-server -y
    if [$? -ne 0 ]
    then
        echo "mysql installation failure"
    else
        echo " mysql installation is success"
    fi

else
    echo " mysql_server is installed successfully"
fi

dnf systemctl enable mysqld 
if [ $? -ne 0 ]
then 
    echo "mysqld is not enabled"
else 
    echo "mysqld is enabled"
fi

systemctl start mysqld
if [ $? -ne 0 ]
then 
    echo "mysqld is not started"
else 
    echo "mysqld is started"
fi

# to check if the password already changed or not. try to connect with the password , if it failed then need to reset.

mysql -h localhost -u root -ppassword ExpenseApp@1

if [ $? -ne 0 ] 
then
    echo " the password is not set.setting ... now"
    mysql_secure_installation --set-root-pass ExpenseApp@1
    
    if [ $? -ne 0 ]
    then 
        echo "failed to reset password"
    else 
        echo "successful password is reset"
    fi

else 
    echo " The Password is already set"
fi





