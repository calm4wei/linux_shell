#!/bin/bash

for i in `cat /etc/hosts |grep datacube2 |awk '{print $2}'`; 
do 
    /usr/bin/ssh $i /user/sbin/userdel hadoop;
    /usr/bin/ssh $i /bin/rm -rf /home/hadoop;
    for t in `cat setup_THP.sh | grep echo`;
    do
	/usr/bin/ssh $i $t;
    done
done

