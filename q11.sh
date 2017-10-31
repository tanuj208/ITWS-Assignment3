#!/bin/bash
read operation
read number
if [ "$operation" == "+" ]
then
	add=0
	for((i=1;i<=$number;i++))
	do
	read operand
	let add=$add+$operand
	done
	echo $add
fi


if [ "$operation" == "-" ]
then
	read operand
	subtract=$operand
	for((i=1;i<$number;i++))
	do
		read operand
		let subtract=$subtract-$operand
	done
	echo $subtract
fi


if [ "$operation" == "*" ]
then
	multiply=1
	for((i=1;i<=$number;i++))
	do
		read operand
		let multiply=$multiply*$operand
	done
	echo $multiply
fi


if [ "$operation" == "/" ]
then
	read operand
	divide=$operand
	for((i=1;i<=$number-1;i++))
	do
		read operand
		#display till 4 decimal digits 
		divide=`echo "scale=4;($divide/$operand)" | bc -l`
	done
	echo $divide
fi
