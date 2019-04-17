#!/bin/bash

i=$1
timeout=$2

printf $i'\n' | bash create_config.sh 
printf $i'\n' | timeout $timeout bash start_fuzzing.sh
printf $i'\n ttt\n' | bash start_learning.sh
