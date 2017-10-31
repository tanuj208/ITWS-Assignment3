#!/bin/bash
cat crontab_q3 | crontab > /dev/null 2>&1
#if format is incorrect it will show an error, that error is nullified
if [ $? -ne 0 ]
#if command did not work then $? will not be zero
then
	echo "No"
else
	echo "Yes"
fi
