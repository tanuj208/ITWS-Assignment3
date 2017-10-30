#!/bin/bash
read number
echo -n "("
# replacing all brackets with blank spaces and then printing a pair of brackets at extremesUa=`echo $number | tr "(" " " | tr ")" " " | `
a=`echo $number | tr "(" " " | tr ")" " " | tr -s " "`
echo -n $a
echo -n ")"
echo
