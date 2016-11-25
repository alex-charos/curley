#!/bin/bash
# Simple script that calls a list of urls and outputs the result
# urls.txt required with one url per line
echo $(date) "Starting..."

for i in $(cat $1); do
	content="$(curl -I "$i")"
	echo $i "Called!"
done
echo $(date) "Finished..."
