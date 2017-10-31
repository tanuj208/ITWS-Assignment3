#!/bin/bash
for a in `cat q15_url.txt`
do
	#w3m displays the webpage in temp file
	w3m $a >> temp
done
#deleting multiple spaces and lines and then replacing spaced by lines
#using uniq -c to count occurrence of each text and then sorting
#redirecting to q15_ans.txt
cat temp | tr -s " " | tr -s "\n" | tr " " "\n" | tr -s "\n" | sort | uniq -c | sort -nr | awk '{print $2" "$1}' | uniq > q15_ans.txt
rm temp
