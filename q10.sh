#!/bin/bash
f=1
for i in "$@"
do
	if [ $i -eq $1 ] && [ $f != 2 ] 
	then 
		a=$1
		f=2
	else
		let a=$a**$i
	fi
done
echo $a

