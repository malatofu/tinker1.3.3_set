#! /bin/bash

version=v1.3.3-a
homeusr=linaro

sudo mkdir /jydz

sudo cp -r `ls ./|grep -v first_config.sh|xargs` /jydz

#jydz文件配置
sudo chmod +x /jydz/backup/*
sudo chmod +x /jydz/bin/*
sudo chmod +x /jydz/shell/*
sudo chmod +x /jydz/system/*
sudo cp /jydz/shell/kill_camera.sh /home/$homeusr/Desktop/开始移虫.sh

#打开串口ttyS0
#/boot/config.txt to enable UART function
sudo cp /boot/config.txt /jydz/config.txt.bak
sudo mv /jydz/config.txt /boot/config.txt
sudo mv /jydz/librknn_api.so /usr/lib/

#创建userdata目录
sudo mkdir -p /userdata/jydz/pic

#display文件配置
 #移植opencv的include和lib
sudo cp /jydz/display/show_lib/* /usr/lib/
sudo cp /jydz/display/display.sh /home/$homeusr/Desktop/摄像头.sh
sudo chmod +x /jydz/display/main

sudo chmod +x /home/$homeusr/Desktop/*.sh

#写入开机自启动,rtc更新
line=`cat /etc/rc.local|grep -c "sh /jydz/system/start.sh &"`
line1=`cat /etc/rc.local|grep -c "sh /jydz/system/rtc.sh &"`
echo $line
echo $line1
if [ $line1 -eq 0 ];then
	sudo sed -i '/exit 0$/i sh /jydz/system/rtc.sh &' /etc/rc.local
fi
if [ $line -eq 0 ];then
	sudo sed -i '/exit 0$/i sh /jydz/system/start.sh &' /etc/rc.local
fi
sudo chmod +x /etc/rc.local

echo "version:"$version >> /userdata/jydz/log/update.log

sudo shutdown now


