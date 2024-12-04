#!/bin/ash

netstat -an | grep 2222 > /dev/null
if [ 0 != $? ]; then
  exit 1
fi
