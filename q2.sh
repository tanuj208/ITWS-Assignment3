#!/bin/bash
cat ~/.bash_history | sort | uniq -c | sort -nr | awk '{print $2" "$1}' | uniq
#counts number of occurences of a command then sorted by numerical value in descending order and then printing command name first.
