#!/bin/bash

for i in `cat /etc/hosts |grep datacube2 |awk '{print $2}'`; 
do 
    scp -r /etc/profile root@$i:/etc/;
    /usr/bin/ssh $i source /etc/profile;
done

