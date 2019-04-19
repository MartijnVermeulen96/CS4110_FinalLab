#!/bin/bash

> output.csv
for folder in Problem*
do
  echo -e "${folder}\n"
  command_1="wc -l ${folder}/learning_error.txt | awk '{ print \$1 }'"
  command_2="wc -l ${folder}/learning_paths.txt | awk '{ print \$1 }'"
  command_3="wc -l ${folder}/learning_states.txt | awk '{ print \$1 }'"


  printf "${folder}," >> output.csv
  printf "learning_error," >> output.csv
  eval $command_1 >> output.csv
printf "${folder}," >> output.csv
  printf "learning_paths," >> output.csv
  eval $command_2 >> output.csv

printf "${folder}," >> output.csv
  printf "learning_states," >> output.csv
  eval $command_3 >> output.csv



  >> output.csv
done
