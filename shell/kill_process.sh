#! /bin/bash

proc=`ps aux|grep "/jydz/shell/start.sh"|grep -v "grep"|awk '{print $2}'`
echo $proc
echo linaro|sudo -S kill $proc
proc1=`ps aux|grep "/jydz/bin/main"|grep -v "grep"|awk '{print $2}'`
echo $proc1
echo linaro|sudo -S kill $proc1
#proc2=`ps aux|grep "MyModel_separate"|grep -v "grep"|awk '{print $2}'`
#echo $proc2
#echo root|sudo -S kill $proc2
#if [ $1 -eq 1 ];then
#	sh /egg_machine/shell/camera_test.sh
#fi


