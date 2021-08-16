#! /bin/bash

#date
date_day=`date +%Y_%m_%d`
date_time=`date +%H-%M-%S`

pass=linaro

#home
path_main=/jydz/

#userdata
path_data_main=/userdata/jydz/

#pic
path_pic=$path_data_main"pic/"

path_pic_exp=$path_pic"pic"
path_pic_save=$path_pic$date_day



# path_code=$path_main"code"
# path_log=$path_main"log"



# date_yesterday=`date +"%Y_%m_%d" -d "-1 days"`
# path_yesterday=$path_pic"/justphoto"$date_yesterday

#输入参数对应功能
#0---创建当天图像存储文件夹
#1---保存当时(如果进行了网络时间校准)图像文件
if [ $1 == 0 ];then
	cd $path_pic
	ls -l|grep $date_day
	if [ $? == 1 ];then
		echo $pass|sudo -S mkdir $path_pic_save
	fi

elif [ $1 == 2 ];then
	if [ ! -e $path_pic ];then
		sudo -S mkdir -p $path_pic
	fi
	sudo chmod 777 $path_pic -R
	if [ -e $path_pic_exp ];then
		sudo chmod 777 $path_pic_exp -R
		cd $path_pic
		ls -l|grep $date_day
		if [ $? == 1 ];then
			echo $pass|sudo -S mkdir $path_pic_save
		fi
		mv $path_pic_exp $path_pic_save"/$date_time"
	fi
	if [ ! -e $path_pic_exp ];then
		echo $pass|sudo -S mkdir $path_pic_exp
		cd $path_pic_exp
		mkdir yuantu youchong wuchong fengmi huafen wuyuan laji circle
	fi
#2---保存图片
elif [ $1 == 1 ];then
	if [ ! -e $path_pic ];then
		sudo -S mkdir -p $path_pic
	fi
	sudo chmod 777 $path_pic -R
	if [ -e $path_pic_exp ];then
		cd $path_pic_exp
		p_num=`ls -lR|grep "^-"|wc -l`
		echo $p_num
		if [ $p_num -gt 33 ];then
			sudo chmod 777 $path_pic_exp -R
			cd $path_pic
			r=`ls|grep pic|wc -l`
			mv $path_pic_exp $path_pic_exp$r
		elif [ $p_num -gt 0 ];then
			sudo rm $path_pic_exp -rf
		fi
	fi
	if [ ! -e $path_pic_exp ];then
		mkdir $path_pic_exp
		cd $path_pic_exp
		mkdir yuantu youchong wuchong fengmi huafen wuyuan laji circle
	fi



#2---创建日志
#3---日志管理
	#0---开机
	#1---关机
	#2---巣板开始
	#3---巣板结束
#4---临时使用
#tensor文件夹创建




# elif [ $1 == 2 ];then
# 	cd $path_log
# 	ls -l|grep $date_day
# 	r=$?
# 	if [ $r == 1 ];then
# 		echo root|sudo -S touch day_$date_day.log
# 		sudo -S chmod 777 day_$date_day.log
# 		echo "touch log time:$date_time" >> $path_log/day_$date_day.log
# 	fi

# elif [ $1 == 3 ];then
# 	cd $path_log
# 	if [ $2 == 0 ];then
# 		echo "-------------------" >> day_$date_day.log
# 		echo "egg_machine start:$date_time" >> day_$date_day.log
# 	elif [ $2 == 1 ];then
# 		echo "egg_machine end:$date_time" >> day_$date_day.log
# 		echo "-------------------" >> day_$date_day.log
# 	elif [ $2 == 2 ];then
# 		echo "-------------------" >> day_$date_day.log
# 		echo "egg_board start:$date_time" >> day_$date_day.log
# 		echo "brightness:$3" >> day_$date_day.log
# 	elif [ $2 == 3 ];then
# 		echo "egg_board end:$date_time" >> day_$date_day.log
# 		echo "-------------------" >> day_$date_day.log
# 	elif [ $2 == 6 ];then
# 		echo "-------------------" >> day_$date_day.log
# 		echo "start_hang:$3,start_lie:$4" >> day_$date_day.log
# 	elif [ $2 == 7 ];then
# 		echo "latest_hang:$3,latest_lie:$4,time:$date_time" >> day_$date_day.log
# 		echo "-------------------" >> day_$date_day.log
# 	elif [ $2 == 8 ];then
# 		echo "*******************" >> day_$date_day.log
# 		echo "code error:$date_time" >> day_$date_day.log
# 		echo "*******************" >> day_$date_day.log
# 	elif [ $2 == 9 ];then
# 		echo "*******************" >> day_$date_day.log
# 		echo "code die:$date_time" >> day_$date_day.log
# 		echo "*******************" >> day_$date_day.log
# 	elif [ $2 == 10 ];then
# 		echo "br:$3,$4,$5,$6" >> day_$date_day.log
# 	fi
# elif [ $1 == 4 ];then
# 	cd $path_yesterday
# 	ls -l|grep "1_tf"
# 	r=$?
# 	if [ $r == 1 ];then
# 		echo root|sudo -S mkdir 1_tf
# 		cd 1_tf
# 		sudo -S mkdir 0 1 2
# 		cd $path_log
# 		echo "build tf_pic file:$date_time" >> day_$date_day.log
# 		echo "+++++++++++++++++" >> day_$date_day.log
# 	fi

# elif [ $1 == 5 ];then
# 	cd $path_pic
# 	ls -l|grep "tf_ckpt"
# 	r=$?
# 	if [ $r == 1 ];then
# 		echo root|sudo -S mkdir tf_ckpt
# 		cd $path_log
# 		echo "build tf_ckpt file:$date_time" >> day_$date_day.log
# 		echo "+++++++++++++++++" >> day_$date_day.log
# 	fi

# elif [ $1 == 6 ];then
# 	cd $path_pic
# 	ls -l|grep "tf_ckpt"
# 	r=$?
# 	if [ $r == 0 ];then
# 		echo root|sudo -S rm tf_ckpt -rf
# 		cd $path_log
# 		echo "remove tf_ckpt file:$date_time" >> day_$date_day.log
# 		echo "+++++++++++++++++" >> day_$date_day.log
# 	fi

fi




