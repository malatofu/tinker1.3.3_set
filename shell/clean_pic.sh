#!/bin/bash
pic_path=/userdata/jydz/pic
#这里文件名格式“pic*”，所以从第一栏的第四位开始排序
function file_sort(){
	array=$(ls $1|grep pic|sort -k1.4n)
	t=0
	cd $1
	for i in ${array}
	do	
		#if [ $t -ne 0 ] && [ "${i}" != "pic"$t ];then
		if [ $t -ne 0 ];then
			mv ${i} "pic"$t
		fi
		let t+=1
	done
}

function clean_pic(){
	array=$(ls $1|grep pic|sort -k1.4n)
	cd $1
	t=0
	for i in ${array}
	do
		if [ $t -lt 100 -a $t -ne 0 ];then
			rm ${i} -rf
		fi
		let t+=1
	done
}

function file_clean(){	#pic_path  path_pic_save
	sudo chmod 777 $1 -R
	echo 1 > /userdata/jydz/log/rknn.log
	clean_pic $1
	file_sort $1

}

file_clean $pic_path
