#!/bin/bash

problem=$1
timeout=$2

if [ $problem == 1 ]||[ $problem == 2 ]||[ $problem == 3 ] || [ $problem == 11 ]||[ $problem == 12 ]||[ $problem == 13 ] 
then
	inputdir="AFL-inputs_1-10"
fi

if [ $problem == 4 ]||[ $problem == 5 ]||[ $problem == 6 ] || [ $problem == 14 ]||[ $problem == 15 ]||[ $problem == 16 ] 
then
	inputdir="AFL-inputs_1-15"
fi

if [ $problem == 7 ]||[ $problem == 8 ]||[ $problem == 9 ] || [ $problem == 17 ]||[ $problem == 18 ]||[ $problem == 19 ] 
then
	inputdir="AFL-inputs_1-20"
fi


mkdir -p Problem$problem/findings
timeout $timeout afl-fuzz -i $inputdir -o Problem$problem/findings Problem$problem/a.exe
