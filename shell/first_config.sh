#! /bin/bash


# #给apt换源
# deb http://mirrors.163.com/debian/ stretch main non-free contrib \
# deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib \
# deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib \
# deb-src http://mirrors.163.com/debian/ stretch main non-free contrib \
# deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib \
# deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib \
# deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib \
# deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib 
# #安装libgtk2.0-dev的依赖
# sudo apt-get install libxinerama-dev libxrandr-dev libxcomposite-dev libxdamage-dev
#  sudo apt-get install x11proto-composite-dev x11proto-damage-dev x11proto-xinerama-dev x11proto-randr-dev

homeusr=linaro

#jydz文件配置
sudo chmod +x /jydz/bin/*
sudo chmod +x /jydz/shell/*	
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
#写入开机自启动
line=`cat /etc/rc.local|grep -c "sh /jydz/shell/start.sh &"`
echo $line
if [ $line -eq 0 ];then
	sudo sed -i '/exit 0$/i sh /jydz/shell/start.sh &' /etc/rc.local
fi
sudo chmod +x /etc/rc.local

#添加终端链接到桌面
sudo ln -s /usr/share/applications/lxterminal.desktop /home/$homeusr/Desktop/

#修改localtime时区
sudo mv /etc/localtime /etc/localtime.bak
sudo ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#写入rtc
sudo hwclock -w

if [ -e /media/$homeusr/CHENJUNJIE ];then
	sudo umount /media/$homeusr/CHENJUNJIE
fi


