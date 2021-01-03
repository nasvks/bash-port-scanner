#!/usr/bin/env bash
#
# Usage: bash scan.sh --host <ip-address> [--ports <port1,port2>]
# Author: Nasso Vikos <nas@vks.io>

# Check which parameters exist
if [[ $1 ]] && [[ $2 ]] && [[ ! $3 ]] && [[ ! $4 ]]; then
  # Use /etc/services file as port list
  if [[ -f /etc/services ]]; then
    while read -r protocol port alias description; do
      if [[ $port =~ "tcp" ]]; then
        ports+=(${port/\/tcp})
      else
        continue
      fi
    done < /etc/services
  else
    echo "Error: Can't find file /etc/services."
    exit 1
  fi
elif [[ $1 ]] && [[ $2 ]] && [[ $3 ]] && [[ $4 ]]; then
  # Use --ports argument as port list
  ports=(${4//,/ })
else
  echo "Usage: bash scan.sh --host <ip-address> [--ports <port1,port2>]"
  exit 1
fi

host=$2

function probe {
( pid=$BASHPID;
  (sleep 1; kill $pid) \
  & while read -r; do
      continue
    done < /dev/tcp/"$host"/"$port" )
}

for port in "${ports[@]}"; do
  probe "$port" 2> /dev/null
  if [ $? == 1 ]; then
    echo "$port/tcp closed"
  else
    echo "$port/tcp open"
  fi
done
