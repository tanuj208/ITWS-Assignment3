#!/bin/bash
if [ "$1" == "nthsalary" ]
then
	a=`cat employee.txt | cut -d ',' -f 3 | sort -nr | uniq | head -$2 | tail -1`
#taking the 3rd column using delimiter as "," and sorting the 3rd column. Then merging duplicate and taking the nth highest in a.
	cat employee.txt | grep "$a"
fi


#using uniq -d to print the line that is repeated
if [ "$1" == "duplicate" ]
then 
	echo `cat employee.txt | sort | uniq -d`
fi


if [ "$1" == "read" ]
then
	if [ "$2" == "eno" ]
	then
		awk -F, -v keyword="$3" '$1 == keyword  { print $0 }' employee.txt
	elif [ "$2" == "name" ]
	then
		awk -F, -v keyword="$3" '$2 == keyword { print $0 }' employee.txt
	elif [ "$2" == "esalary" ]
	then
		awk -F, -v keyword="$3" '$3 == keyword { print $0 }' employee.txt
	fi
fi


if [ "$1" == "write" ]
then
	echo "$2,$3,$4" >> employee.txt
	echo "Done"
fi

if [ "$1" == "update" ]
then
	for i in `cat employee.txt`
	do
		eno=`echo $i | cut -d "," -f 1`
		if [ "$2" == "$eno" ]
   		#if eno matches then replace using sed
		then
			sed -i "/$i/c\\$2,$3,$4" ./employee.txt
		fi
	done
	echo "Done"
fi
if [ "$1" == "delete" ]
then
	a=1
	for i in `cat employee.txt`
	do
		x=`echo $i | cut -d "," -f 1`
		if [ "$2" -eq "$x" ]
		then
			sed -i "${a}d" employee.txt
			continue
		fi
		a=$(($a+1))
	done
	echo "Done"
fi
