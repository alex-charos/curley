#!/bin/bash
crontab -l > mycron
echo "0,30 * * * * curley.sh" >> mycron
crontab mycron
rm mycron
