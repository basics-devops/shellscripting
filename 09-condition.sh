#!/bin/bash

#conditions 

set -x  # execute in debig mode.
A=$1

if [ $A -gt 10 ]
then
    echo "The given number is greater than 10"
else
    echo "The given number is lesser than 10"
fi

