#!/bin/bash

for i in $(cat urls.txt); do
	content="$(curl -s "$i")"
	echo "$content" >> results.txt
done
