#!/usr/bin/env bash

host=$1
ports=(22 25 80 443 999)

function probe {
( pid=$BASHPID;
  (sleep 1; kill $pid) \
  & while read -r; do
      continue
    done < /dev/tcp/"$host"/"$port" )
}

for port in "${ports[@]}"; do
  probe 2> /dev/null
  if [ $? == 1 ]; then
    echo "$port/tcp closed"
  else
    echo "$port/tcp open"
  fi
done
