#!/bin/bash

# take a filename as an argument
# the file contains urls on each line
# foreach url resolve the ip and update the host file

filename=$1
outputfile=$2
while read -r line; do
  dig +short $line | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | while read -r ip; do
    entry="$ip $line"
    echo $entry
    # add the entry to host file, if it does not already exist
    grep -q "$entry" $outputfile
    if [ $? -ne 0 ]; then
      echo $entry >>$outputfile
    fi
  done
done <$filename
