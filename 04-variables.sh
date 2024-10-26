#!/bin/bash

#assign variables from prompt. (taking the input values while running the script.)

echo "please enter the name of person1"
read -s person1   # -s refer to secure.this wont display the input user provide.

echo "please enter the name of the person2"
read -s person2

echo "$person1 : Hi ${person2} how are you"
echo "$person2 : I am fine!"

