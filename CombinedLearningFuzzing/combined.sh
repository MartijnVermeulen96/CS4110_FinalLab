#!/bin/bash
printf "Enter timeout (1d, 1m, 3h, etc..): "
read timeout
"$@"

printf "Which problems should I execute? (enter as 1 2 5 6 ..): "
read -a  problems

printf "Should I also do the fuzzing? (false if already done): "
read fuzzing


for i in in ${problems[@]}
do
	echo $i
	gnome-terminal -e "bash execute.sh $i $timeout $fuzzing"
done

sleep $timeout
echo "Done."
