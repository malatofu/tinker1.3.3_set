#!/bin/sh

#2021-08-14 14:29:59
#每隔十分钟保存一次时间

#输入一个参数，间隔多长时间，单位秒
time_save(){
	i=`wc -l /jydz/system/rtc.txt|awk '{print $1}'`
	rtc_time=`date +%Y-%m-%d' '%H:%M:%S`
	if [ ${i} -ge 6 ];then
		num=`expr $i - 5`
		echo "linaro"|sudo -S sed -i "1,${num}d" /jydz/system/rtc.txt
	fi
	echo ${rtc_time} >> /jydz/system/rtc.txt
	sleep $1
}

#最后一行时间格式是否正确，不正确删除
last_saved_num=`echo "linaro"|sudo -S sed -n '$p' /jydz/system/rtc.txt|wc -c`
if [ ${last_saved_num} -ne 20 ];then
	echo "linaro"|sudo -S sed '$d' /jydz/system/rtc.txt
fi

#获取最后一行时间，并更新
saved_time=`sed -n '$p' /jydz/system/rtc.txt`
echo "linaro"|sudo -S date -s $saved_time
echo "linaro"|sudo -S hwclock -w


#每十分钟保存一次时间
while true
	do
		time_save 600
	done


