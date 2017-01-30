#!/bin/bash

# Get an md5 hash of the hashes of all the files in /src
FILE_MD5=$(find /src/ -type f -exec md5sum {} \; | md5sum | cut -f1 -d ' ')

# Start nginx in background
/usr/bin/openresty -c /src/conf/nginx.conf &

# Trap and handle signals sent to this scripts process
trap "kill -SIGTERM $(pgrep openresty); exit" SIGHUP SIGINT SIGTERM SIGKILL

# Test files every 2 seconds and reload Openresty on changes to any files
while true
do
  sleep 2
  TEST_MD5=$(find /src/ -type f -exec md5sum {} \; | md5sum | cut -f1 -d ' ')
  if [ "$FILE_MD5" != "$TEST_MD5" ]
  then
    echo "Changes detected. Reloading Openresty..."
    kill -SIGHUP $(pgrep openresty)
    FILE_MD5=$TEST_MD5
  fi
done
