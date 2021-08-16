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

run(){
	echo "run"
	#创建当天的存储文件夹
#	bash /jydz/shell/auto_run.sh 0
	if [ ! -e $path_log ];then
		echo $pass|sudo -S mkdir -p $path_log
		cd $path_log
		sudo -S touch rknn.log
		sudo -S chmod 666 $path_log/rknn.log
	fi
	if [ ! -e $path_log/rknn.log ];then
		cd $path_log
		echo $pass|sudo -S touch rknn.log
		sudo -S chmod 666 $path_log/rknn.log
	fi
	echo $pass|sudo -S /jydz/bin/main 0 >> $path_log/rknn.log &
}

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


#5242880 5g
filesizecheck(){
	disk_size=`du -s $1|awk '{print $1}'`
	if [ $disk_size -gt $2 ];then
		bash /jydz/shell/clean_pic.sh
		echo "delete"
	fi
}

start(){
	run
	while true
	do
		proc=`ps aux|grep "/jydz/bin/main"|grep -v "grep"|awk '{print $2}'`
		if [ "$proc" = "" ];then
			run
		fi
		#是否有外部挂载的RKNN的存储
		if [ -e $u_path ];then
			break		
		fi
		filesizecheck /userdata/jydz 5242880
		sleep 5
	done
}

start
save

