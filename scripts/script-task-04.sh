#!/usr/bin/env bash
ips=("173.194.222.113" "87.250.250.242" "192.168.0.1")
exit=0
while (($exit==0))
do
  for ip in ${ips[@]}
  do
    echo ip= $ip:80
    curl -I -s -m 3 $ip:80 >> error.log
    if (($? != 0))
        then
            let "exit=1"
            echo $ip is down
            break
        fi
  done
done
