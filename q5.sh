#!/bin/bash
cat $1 >> file3.txt
cat $2 >> file3.txt
#to check if no of columns are entered are either one or two or three or four
	if [ $# == 3 ]
	then
		cat file3.txt | sort -k$3,$3
	elif [ $# == 4 ]
	then
		cat file3.txt | sort -k$3,$3 -k$4,$4
	elif [ $# == 5 ]
	then
		cat file3.txt | sort -k$3,$3 -k$4,$4 -k$5,$5
	elif [ $# == 6 ]
	then
		cat file3.txt | sort -k$3,$3 -k$4,$4 -k$5,$5 -k$6,$6
	fi
cat file3.txt
rm file3.txt
