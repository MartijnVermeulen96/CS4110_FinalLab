#!/bin/bash
echo -n "Enter the problem number [ENTER]: "
read problem
cp config/application-target-rers_template.properties config/application-target-rers_$problem.properties
sed -i 's/\$i\$/'$problem'/g' config/application-target-rers_$problem.properties

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "$BASEDIR"

if [ $problem == 1 ]||[ $problem == 2 ]||[ $problem == 3 ] || [ $problem == 11 ]||[ $problem == 12 ]||[ $problem == 13 ] 
then
	alphabet="1,2,3,4,5,6,7,8,9,10"
fi

if [ $problem == 4 ]||[ $problem == 5 ]||[ $problem == 6 ] || [ $problem == 14 ]||[ $problem == 15 ]||[ $problem == 16 ] 
then
	alphabet="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"
fi

if [ $problem == 7 ]||[ $problem == 8 ]||[ $problem == 9 ] || [ $problem == 17 ]||[ $problem == 18 ]||[ $problem == 19 ] 
then
	alphabet="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20"
fi


sed -i 's/\$alphabet\$/'$alphabet'/g' config/application-target-rers_$problem.properties

printf -v BASEDIR2 "%q" $BASEDIR
BASEDIR2=$( sed 's:/:\\/:g'  <<<"$BASEDIR")

sed -i 's/\$dir\$/'$BASEDIR2'/g' config/application-target-rers_$problem.properties

mkdir -p Problem$problem
mkdir -p Problem$problem/findings
mkdir -p Problem$problem/config

mv config/application-target-rers_$problem.properties Problem$problem/config/application-target-rers_$problem.properties
