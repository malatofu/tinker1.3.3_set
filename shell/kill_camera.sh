#! /bin/bash

proc=`ps aux|grep "/jydz/display/main"|grep -v "grep"|awk '{print $2}'`
echo $proc
echo root|sudo -S kill $proc

sh /jydz/shell/start.sh &

