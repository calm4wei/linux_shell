#!/bin/sh

for((i=0;i<=100;i++))
do 
	sleep 0.1 
	echo $i | dialog --title '正在远程下载' --gauge '下载中' 10 70 0 
done

#clear
echo -ne  "\033[2J"
