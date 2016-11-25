#!/bin/bash
crontab -l > mycron
gre=$(grep "curley.sh" "mycron")
if [ ${#gre} -eq  0 ]
then
	echo "will add cronjob"
	echo "0,30 * * * * curley.sh" >> mycron
	crontab mycron
fi
rm mycron
