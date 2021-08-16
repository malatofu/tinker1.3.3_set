#!/bin/sh

#2021-08-14 14:29:59
#每隔十分钟保存一次时间

#最后一行时间格式是否正确，不正确删除
last_c_num=`sed -n '$p' /jydz/system/rtc.txt|wc -c`
if [ $last_c_num -ne 19 ];then
	sed '$d' /jydz/system/rtc.txt
fi

#获取最后一行时间，并更新
saved_time=`sed -n '$p' /jydz/system/rtc.txt`
date -s $saved_time
hwclock -w

#每十分钟保存一次时间
while true
	do
		i=`wc -l /jydz/system/rtc.txt`
		rtc_time=`date +%Y-%m-%d' '%H:%M:%S`
		if [ $i -eq 6 ];then
			sed '1d' /jydz/system/rtc.txt
		fi
		echo $rtc_time >> /jydz/system/rtc.txt
		sleep 600
	done


