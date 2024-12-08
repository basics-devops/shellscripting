#!/bin/bash
# the task is to clear a log files but cretaing a zip and transfer it to other destination folder
DESTINATION_DIR=$1
SOURCE_DIR=$2
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
DAYS=${3:-14}  #if $3 is empty, default is 14 days.

USAGE() {
    echo "USAGE :: sh 18-backup_old_log.sh <source_dir> <destination_dir>"
}

#checking the arguments passed correct or not!
if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

#checking if the destination directory exist or not
if [ ! -d $DESTINATION_DIR ]
then
    echo "$DESTINATION_DIR doesn't exist"
    exit 1
else
    echo "$DESTINATION_DIR exist!"

#checking if the source directory exist or not
if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR doesn't exist"
    exit 1
else
    echo "$SOURCE_DIR exist!"

#finds the files in source destination more than no of days mentioned and supplied into variable.
FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

# if the files are not available then exits.
if [ ! -z $FILES ]
then
    echo "files exist zipping them"
    ZIP_FILE="$DESTINATION_DIR/app-log-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS | zip "$ZIP_FILE" -@
else
    echo "files doesn't exist"
    exit 1
fi

#checks if the zip file is available then removes the files if it is successfull.
if [ ! -z $ZIP_FILE ]
then
    echo "zipping is successfully done"
    while IFS = read -r file 
    do
        echo "deleting : $file"
        rm -rf $file
    done <<< $FILES

else
    echo "zipping is failed"
    exit 1
fi









