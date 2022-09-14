#!/bin/bash

# take a filename as an argument
# the file contains urls on each line
# foreach url resolve the ip and update the host file

filename=$1
while read -r line; do
    ip=$(dig +short $line | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | head -n 1)
    echo "$ip $hostname" >> /etc/hosts
done <$filename
