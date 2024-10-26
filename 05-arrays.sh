#!/bin/bash

students=("raju","ravi","rakesh")

#the indexing starts from 0,1,2,...n-1
echo " the student 1 is ${students[0]}"   # raju
echo " the student 1 is ${students[1]}"   #ravi
echo " the student 1 is ${students[2]}"    #rakesh

echo " All students are ${students[@]}" 