#!/bin/bash

echo 'Now running at most 7 processes at one time'
printf 'Enter timeout: '
read timeout

for i in 1 2 3 4 5 6 7 
do
	gnome-terminal -e "bash start_fuzzing.sh $i $timeout"
done
sleep $timeout

for i in 8 9 11 12 13 14 15
do
	gnome-terminal -e "bash start_fuzzing.sh $i $timeout"
done
sleep $timeout

for i in 16 17 18 19
do
	gnome-terminal -e "bash start_fuzzing.sh $i $timeout"
done
sleep $timeout
echo "Done"
