#!/bin/bash

i=$1
timeout=$2
fuzzing=$3

printf $i'\n' | bash create_config.sh 
if [$fuzzing = true ]; then
	printf $i'\n' | timeout $timeout bash start_fuzzing.sh
fi
printf $i'\n ttt\n' | bash start_learning.sh
