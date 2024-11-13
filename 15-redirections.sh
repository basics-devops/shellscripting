#!/bin/bash
# the output log for this script is copied into a log file.

#task : perform certain actions let say installing a package.this log has to be saved in lof file with name : scriptname_timestamp

LOG_FOLDER=/var/log/shell-script
SCRIPT_NAME=$(echo $0| cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=$LOG_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log


R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$2 package $R installation failed $N"   | tee -a $LOG_FILE  #Here, -e enables the interpretation of escape sequences. 
    else
        echo -e  "$G successfully installed $N"   | tee -a $LOG_FILE   # tee -a will show the log on console as well as writes into log file.
    fi
}

user_id=$(id -u)

if [ $user_id -ne 0 ] #if not zero then warn user to connect with root priviliges and exit the script.
then
    echo "please connect with root user access"   | tee -a $LOG_FILE  
    exit 1
fi

# passing the packages names as variables.
#sh 14-loops.sh mysql git nginx

for i in $@ # this takes all the arguments passed to it.
do
    dnf list installed $i
    if [ $? -ne 0 ]
    then
        echo "$i package not installed.installing now" | tee -a $LOG_FILE
        dnf install $i -y &>>$LOG_FILE
        VALIDATE $? $i
    else 
        echo " $i package is already there. noting to do" | tee -a $LOG_FILE
    fi
done