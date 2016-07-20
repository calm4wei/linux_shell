<<!
 **********************************************************
 * Author        : Feng.Wei
 * Email         : alferwei98@163.com
 * Last modified : 2016-07-20 11:17
 * Filename      : reboot_all.sh
 * Description   : 
 * *******************************************************
!

#!/bin/sh

Usage="$0 {reboot|shutdown}"

check_params() {
    tput bold
    echo $Usage
    tput sgr0
    exit 1
}

run() {
	echo $COMMOND
    echo -e "\033[41m Are you sure to $1 all machines?(y/n): \033[0m" 
    read -p "" flag

    if [ -z "$flag" ] || [ "$flag" = "n" ]; then 
        echo "do not $1."
        exit 2
    elif [ "$flag" = "y" ]; then 
        echo "Now $1 all machines!"
    else 
		tput bold
        echo "please input y or n"
		tput sgr0
        exit 2
    fi

    for i in `cat /etc/hosts | grep -vE $HOSTNAME | grep datacube | awk '{print $2}'`; 
    do 
        echo "$1 machine $i"
        /usr/bin/ssh $i "/sbin/$COMMOND" 2>>"$LOG_FILE" 1>&2
    done
}

if [ $# -ne 1 ]; then
	check_params
fi

LOG_PATH="/var/log/sys_all/logs"
FILE_NAME=`echo $0 | awk -F "/" '{print $NF}'`
LOG_FILE="$LOG_PATH/$FILE_NAME.`date +%F`.log"

if [ ! -d $LOG_PATH ]; then
    mkdir -p $LOG_PATH
fi

echo "`date +%F\ %T`" >> $LOG_FILE


COMMOND=$1
HOSTNAME=`exec /bin/hostname`
retcode=0

case "$COMMOND" in
    reboot)
		;;
    shutdown)
		COMMOND="$COMMOND now"
		;;
    *)
		check_params	
		exit 1
esac

run $COMMOND
