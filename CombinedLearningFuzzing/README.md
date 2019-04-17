### Combining Fuzzing & Learning
Check out:
https://github.com/praseodym/learning-fuzzing

## Add AFL library
To perform the right AFL calls, please follow the steps at:
https://github.com/praseodym/learning-fuzzing
For the afl and activelearner directory
Then, add the libafl.so to your library (/usr/lib, /lib, or similar ...)

## Copy the problems
Please add the RERS problem sources in this folder with directory prefix Problem*

## Adjust for fuzzing
Create fuzzable programs using 
python FuzzingProblems.py

## Compile for fuzzing
Compile all problems using 
bash afl_g++compile.sh

## Create a new configuration
Create a new spring configuration file for every problem:
bash create_config.sh

## Start fuzzing
Do some fuzzing:
bash start_fuzzing.sh

(Optionally, run with timeout)
timeout 1d bash start_fuzzing.sh

## Start the learning
Start the combined learning with AFL:
bash start_learning.sh

