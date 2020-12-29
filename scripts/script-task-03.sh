#!/usr/bin/env bash
ips=("173.194.222.113" "87.250.250.242" "192.168.0.1")
retry_cnt=5
while (($retry_cnt>0))
do
  let "retry_cnt-=1"
  echo retry_cnt= $retry_cnt
  for ip in ${ips[@]}
  do
    echo ip= $ip:80
    curl -I -s -m 3 $ip:80 > /dev/null
    if (($? != 0))
        then
            echo $ip is down >> curl.log
        else
            echo $ip is up >> curl.log
        fi
  done
done
