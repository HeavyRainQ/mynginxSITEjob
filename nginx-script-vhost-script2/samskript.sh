#!/bin/bash
server1="$(grep -m1 -Poe 'server_name \K[^; ]+' /etc/nginx/sites-available/mytasksite1.ru)"
server2="$(grep -m1 -Poe 'server_name \K[^; ]+' /etc/nginx/sites-available/mytasksite2.ru)"
server3="$(grep -m1 -Poe 'server_name \K[^; ]+' /etc/nginx/sites-available/mytasksite3.ru)"
server4="$(grep -m1 -Poe 'server_name \K[^; ]+' /etc/nginx/sites-available/mytasksite4.ru)"
server5="$(grep -m1 -Poe 'server_name \K[^; ]+' /etc/nginx/sites-available/mytasksite5.ru)"
if [ server1==mytasksite1.ru ] | [ server2==mytasksite2.ru ] | [ server3==mytasksite3.ru ] | [ server4==mytasksite4.ru ] | [ server5==mytasksite5.ru ]; then
server_name1="server_name1: $server1"
server_name2="server_name2: $server2"
server_name3="server_name3: $server3"
server_name4="server_name4: $server4"
server_name5="server_name5: $server5"
curl -v "http://example.com/test" \
'[{
  "key": "qweqweqweqweqweq",
  "vhosts": "$server_name1, $server_name2, $server_name3, $server_name4, $server_name5"
}]'
fi

