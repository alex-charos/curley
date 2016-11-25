#!/bin/bash
DIRECTORY=~/.curley/
crontab -l > mycron
gre=$(grep "curley.sh" "mycron")
if [ ${#gre} -eq  0 ]
then
	echo $DIRECTORY
	if [ -d $DIRECTORY ]
	then
		#mdkir $DIRECTORY
		echo $DIRECTORY exists
	else
		mkdir -p "$DIRECTORY"
 		echo $DIRECTORY created		
	fi
	cp curley.sh $DIRECTORY
	echo curley.sh copied
	echo "will add cronjob"
	echo "0,30 * * * * "$DIRECTORY"curley.sh" >> mycron
	crontab mycron
fi
rm mycron
