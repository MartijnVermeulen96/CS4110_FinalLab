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

## Adjust for Combined learning
Create combined learning programs using 

    python CombinedProblems.py

## Compile for fuzzing
Compile all problems using 

    bash afl_g++compile.sh

## Start the learning
Start the combined learning with AFL, where one can enter the problems one wants to crack. Keep in mind that AFL needs free CPU cores for each process, so limit the batch sizes (to for instance CPU cores-1). This will take care of the configuration setup.

    bash combined.sh


Only use if you want to execute the steps one by one:

### Create a new configuration
Create a new spring configuration file for every problem:
  
    bash create_config.sh

### Start fuzzing
Do some fuzzing:

    bash start_fuzzing.sh

(Optionally, run with timeout)

    timeout 1d bash start_fuzzing.sh
    
### Start the learning

    bash start_learning.sh
