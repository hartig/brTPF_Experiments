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

let killTimeout=10+${timeout}

echo "every query execution will be terminated after ${killTimeout} minutes"

for query in $1/*.rq
do
	echo $query
	results=$(timeout ${killTimeout}m ../../ExtendedClient.js/bin/$4 $2 $query --timeoutInMins $3 --outputFileNumber $5 --maxNumberOfMappings $6)
	echo "$results"
done

date