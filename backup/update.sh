#!/bin/sh

#手动更新
#当start.sh不运行时（丢失，挂起等），用于手动更新所有文件

proc1=`ps aux|grep "/jydz/bin/main"|grep -v "grep"|awk '{print $2}'`
echo $proc1
echo linaro|sudo -S kill $proc1
proc=`ps aux|grep "/jydz/display/main"|grep -v "grep"|awk '{print $2}'`
echo $proc
echo linaro|sudo -S kill $proc

echo linaro|sudo -S sh /media/linaro/RKNN/jydz/update/update.sh &