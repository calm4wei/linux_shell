#!/bin/sh

SRC=$1
DETH=$2
USER=$3
HOSTNAME=`exec /bin/hostname`

for i in `cat /etc/hosts | awk '{print $2}' | grep -v "$HOSTNAME"| grep "datacube"`
do
	scp -r $SRC	$USER@$i:$DETH
done


