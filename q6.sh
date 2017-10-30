#!/bin/bash
read number
echo -n "("
# replacing all brackets with blank spaces and then printing a pair of brackets at extremes
a=`echo $number | tr "(" " " | tr ")" " "`
echo -n $a
echo -n ")"
echo
