#!/bin/bash

> output.csv
for folder in Problem*
do
  echo -e "${folder}\n"
  command_afl="wc -l ${folder}/afl_errors.txt | awk '{ print \$1 }'"

  printf "${folder}," >> output.csv
  printf "afl," >> output.csv
  eval $command_afl >> output.csv
  >> output.csv
done
