#!/bin/sh

Usage='''$0 <src path> <deth path> <user>'''
if [ $# -ne 3 ]; then
    echo "$Usage"
    exit
fi

SRC=$1
DETH=$2
USER=$3
HOSTNAME=`exec /bin/hostname`

for i in `cat /etc/hosts | awk '{print $2}' | grep -v "$HOSTNAME"| grep "datacube1"`
do
	scp -r $SRC	$USER@$i:$DETH
done


