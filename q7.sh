#!/bin/bash
a=`echo "$1" | awk '{print tolower($0)}'`
b=`echo $a | rev`
if [ "$a" == "$b" ]
then 
echo Yes
else
echo No
fi
