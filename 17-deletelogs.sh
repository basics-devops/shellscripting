#!/bin/bash


#task : delete the logs which are older than 7 days.
if [ $# -eq 0 ]
then
    echo "please pass the source destination"
    exit 1
fi

SOURCE_DESTINATION=$1
# checking for the source destination provided by user.
if [ -d $SOURCE_DESTINATION ]
then
    echo "The Source folder exist"
else 
    echo "The source folder doesn't exist"
    exit 1

fi

#Find the files ends with .log and which are older than 7 days. then removes the files.
find ${SOURCE_DESTINATION} -name *.log -mtime +7 -exec rm -rf {} ;\
#---------------------------------------------------
# FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
# echo "Files: $FILES"

# # dont use line, it is reserverd word
# while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
# do
#     echo "Deleting file: $file"
#     rm -rf $file
# done <<< $FILES
#----------------------------------------------
# find . -name "*.log" -mtime +7 | xargs rm -rf