#!/bin/bash
read date 
#error is nullified
date -d "$date" > /dev/null 2>&1
#if error was there than $? is not zero
if [ $? -ne 0 ]
then
	echo "Invalid"
else
	echo `date -d "$date" +%m/%d/%Y`
	echo `date -d "$date" +%d-%m-%Y`
fi
