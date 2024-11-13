#!/bin/bash

#To execute the script in debug mode.

set -x  #debugging mode.
#set -e  # exists the script if there is an error. this will only check the last command of the pipe
#set -o pipefail  # this check for everycommand in pipe 

# also can be declared as 
# set -exo pipefail

failure(){
    echo "Failed at: $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR # ERR is the error signal  

echo "Hello World success"
echooooo "Hello Wolrd failure"   # the commnad echoooo is error here.
echo "Hello World after failure"

