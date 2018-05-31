#!/bin/bash

if [ ! $# -eq 1 ]; then
    echo "Usage: ./check_response_http_code.sh target-file.txt"
    exit
fi

if [ ! -e $1 ]; then
    echo "Target File is Not Found. (" $1 ")"
    exit
fi

TARGET_FILE=$1
CUR_DATE=`date "+%Y%m%d%H%M%S"`

getHttpCd () {
  result=`curl -v $1 2>&1 -o /dev/null`
  resCd=`echo $result | grep -o "< HTTP/\(1.1\|2\) [0-9]\{3\}" | grep -o "[0-9]\{3\}"`
  if [ $redirect_cnt -gt 0 ]; then
    for i in `seq $redirect_cnt`
    do
      printf "="
    done
    printf ">"
  fi
  echo "$resCd : $1"
  if [[ $resCd -eq 301 ]] || [[ $resCd -eq 302 ]] ; then
    redirect_cnt=`expr $redirect_cnt + 1`
    next_url=`echo $result | grep -o "location: https://[0-9a-zA-Z\.-_/]*" | grep -o "https://[0-9a-zA-Z\.-_/]*" | xargs`
    getHttpCd $next_url
  fi
}

while read line
do
  redirect_cnt=0
  getHttpCd $line
  sleep 1s
done < $TARGET_FILE

