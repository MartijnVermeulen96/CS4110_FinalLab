#!/bin/bash
printf "Enter timeout (1d, 1m, 3h, etc..): "
read timeout
"$@"


for i in 1 2 3 4 5 6 7 8 9 11 12 13 14 15 16 17 18 19
do
	gnome-terminal -e "bash execute.sh $i $timeout"
done

