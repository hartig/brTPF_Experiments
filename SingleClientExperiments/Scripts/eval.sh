#!/bin/bash

# Author: Olaf Hartig  http://olafhartig.de

if [ "$#" -lt 5 ]; then
   echo "Illegal number of parameters."
	echo
	echo "Usage: ./eval.sh <dir with queries> <URI of start fragment> <timeout in minutes> (TPF-client-eval | brTPF-client-eval) <string to be attached to file name> <max. number of mappings (only for brTPF)>"
	echo
	echo "Example: ./eval.sh ../../Queries/WatDiv/OneDir100  http://localhost:8080/watdiv  60  brTPF-client-eval  test  30"
	echo
	exit
fi

queriesDir=$1
startFragment=$2
timeoutInMins=$3
command=$4
outputFileNumber=$5
maxNumberOfMappings=$6

echo "$0 $1 $2 $3 $4 $5 $6"
date

let killTimeout=10+${timeoutInMins}

echo "every query execution will be terminated after ${killTimeout} minutes"

for query in ${queriesDir}/*.rq
do
	echo $query
	results=$(timeout ${killTimeout}m ../../ExtendedClient.js/bin/${command} ${startFragment} $query --timeoutInMins ${timeoutInMins} --outputFileNumber ${outputFileNumber} --maxNumberOfMappings ${maxNumberOfMappings})
	echo "$results"
done

date