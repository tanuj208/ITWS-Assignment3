#!/bin/bash
a=`echo "$1" | awk '{print tolower($0)}'`
#print only in lowercase using awk
#rev command reverses the string
b=`echo $a | rev`
if [ "$a" == "$b" ]
then 
	echo Yes
else
	echo No
fi
