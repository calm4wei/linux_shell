#!/bin/bash

for i in `cat /etc/hosts |awk '{print $2}'`; 
do 
    /usr/bin/ssh $i /etc/init.d/iptables stop;
    /usr/bin/ssh $i /sbin/chkconfig iptables off;
done

