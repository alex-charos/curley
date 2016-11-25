#!/bin/bash
# Simple script that calls a list of urls and outputs the result
# urls.txt required with one url per line
for i in $(cat urls.txt); do
	content="$(curl -s "$i")"
	echo "$content" >> results.txt
done
