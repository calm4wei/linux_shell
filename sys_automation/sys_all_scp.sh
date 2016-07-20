<<!
 **********************************************************
 * Author        : Feng.Wei
 * Email         : alferwei98@163.com
 * Last modified : 2016-07-20 11:32
 * Filename      : sys_all_scp.sh
 * Description   : output log path in /var/log/sys_all/
 * *******************************************************
!

#!/bin/bash

Usage="$0 <srcPath> <destPath>"

if [ $# -ne 2 ]; then
	tput bold
	echo $Usage
	tput sgr0
	exit 1
fi

DIRNAME=$(cd $(dirname $0);pwd)

HOSTNAME=`exec /bin/hostname`
USER=`/usr/bin/whoami`
SRC=$1
DEST=$2
LOG_PATH="/var/log/sys_all/logs"
FILE_NAME=`echo $0 | awk -F "/" '{print $NF}'`
LOG_FILE="$LOG_PATH/$FILE_NAME.`date +%F`.log"
retcode=0

if [ ! -d $LOG_PATH ]; then
	mkdir -p $LOG_PATH
fi

echo "`date +%F\ %T`" >> $LOG_FILE
for i in `cat /etc/hosts |grep datacube2 | grep -vE $HOSTNAME | awk '{print $2}'`; 
do 
	tput bold
	echo "*************$i***************" >> "$LOG_FILE"
	tput sgr0 

    /usr/bin/ssh $i "
	/bin/mkdir p $DEST > /dev/null;
    /usr/bin/scp -r $SRC  $USER@$i:$DEST;

#    scp -r /etc/profile root@$i:/etc/;
#    /usr/bin/ssh $i source /etc/profile;
	" 2>>"$LOG_FILE" 1>&2

	retcode=$?
	echo "retcode=$retcode"
done

