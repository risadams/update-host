#!/bin/bash

#take the first argument as a file name
FILE=$1
#read the file line by line
while read LINE; do

  for url in $LINE; do # ensure each argument is a valid url
    if [[ $url =~ ^https?://[a-zA-Z0-9./-]+$ ]]; then
      # get the host name from the url
      host=$(echo $url | awk -F/ '{print $3}')
      # get the ipv4 address of the host
      ip=$(dig +short $host)
      #foreach entry in ip echo the host and ip
      for i in $ip; do

        #if i is an ipv4 address
        if [[ $i =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
          # update the host file
          echo "$ip $host" #>>/etc/hosts
        else
          echo "Invalid ip: $ip - $host"
        fi
      done
    else
      echo "Invalid url: $url"
    fi
  done

done <$FILE
