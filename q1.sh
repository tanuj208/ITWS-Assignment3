#!/bin/bash
read a
flag=0
b=`crunch ${#a} ${#a} -p "$a"`
#variable contains all possible permutations of word 
words=`echo $b | wc -w`
#contains number of words
#checks for matches in four directories
for((i=1;i<=$words;i++))
do
	word=`echo $b | cut -d " " -f $i`
	#takes word by word
	number=`ls /bin | grep -w "$word" | wc -w`
	#contains number of matches
	if [ $number -ne 0 ]
	then
		echo "Yes"
		man $word | col -b | grep -a1 "^\s*-"
		#prints only possible arguments 
		flag=1
		break
	fi
	number=`ls /sbin | grep -w "$word" | wc -w`
	if [ $number -ne 0 ] 
	then    
		echo "Yes"
		man $word | col -b | grep -a1 "^\s*-"
		flag=1
		break
	fi      
	number=`ls /usr/bin | grep -w "$word" | wc -w`
	if [ $number -ne 0 ] 
	then    
		echo "Yes"
		man $word | col -b | grep -a1 "^\s*-"
		flag=1
		break
	fi      
	number=`ls /usr/sbin | grep -w "$word" | wc -w`
	if [ $number -ne 0 ] 
	then    
		echo "Yes"
		man $word | col -b | grep -a1 "^\s*-"
		$word --help
		flag=1
		break
	fi
done
if [ $flag -ne 1 ]
then
	echo "No"
fi
