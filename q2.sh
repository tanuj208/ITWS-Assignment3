#!/bin/bash
cat ~/.bash_history | sort | uniq -c | sort -nr | awk '{print $2" "$1}' | uniq 
