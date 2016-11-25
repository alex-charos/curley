#!/bin/bash
DIRECTORY=~/.curley/
crontab -l > mycron
gre=$(grep "curley.sh" "mycron")
if [ ${#gre} -eq  0 ]
then
	echo $DIRECTORY
	if [ ! -d $DIRECTORY ]
	then
		mkdir -p "$DIRECTORY"
 		echo $DIRECTORY created		
	fi

	if [ -f urls.txt ] 
	then
		cp urls.txt $DIRECTORY
	else
		echo "File urls.txt not found! Please create it with a url per line!"
	fi
	cp curley.sh $DIRECTORY
	echo curley.sh copied
	echo "*/30 * * * * "$DIRECTORY"curley.sh "$DIRECTORY"urls.txt >> "$DIRECTORY"results.txt" >> mycron
	echo "cronjob added"
	crontab mycron
fi
rm mycron
