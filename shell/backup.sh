#!/bin/sh

#更新完或拷贝完数据后，关机
#path_pic是本地pic存储
#pic_path是外部存储设备

pass=linaro
u_path=/media/$pass/RKNN/jydz
pic_path=$u_path/pic
log_path=$u_path/log
update_path=$u_path/update


date_day=`date +%Y_%m_%d`
date_time=`date +%H-%M-%S`

#userdata
path_data_main=/userdata/jydz/

#pic
path_pic=$path_data_main"pic/"

path_pic_exp=$path_pic"pic"
path_pic_save=$path_pic$date_day

#log
path_log=$path_data_main"log"


save(){
	if [ -e $pic_path ];then
		echo $pass|sudo -S mv $path_pic* $pic_path"/"$date_day"-"$date_time"/"
	fi
	if [ -e $log_path ];then
		echo $pass|sudo -S mv $path_log/* $log_path"/"$date_day"-"$date_time"/"
		cd $path_log		
		sudo -S touch rknn.log
	fi
	#更新
	if [ -e $update_path ];then
		echo $pass|sudo -S sh $update_path"/update.sh"
	fi
}


start(){
	run
	while true
	do
		proc=`ps aux|grep "/jydz/shell/start.sh"|grep -v "grep"|awk '{print $2}'`
		if [ "$proc" = "" ];then
			save
		fi
		sleep 15
	done
}

start

