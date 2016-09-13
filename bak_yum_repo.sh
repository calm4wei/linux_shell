#!/bin/bash

for i in `cat /etc/hosts |grep datacube2 |awk '{print $2}'`; 
do 
    /usr/bin/ssh $i /bin/mkdir /etc/yum.repos.d/bak;
    /usr/bin/ssh $i /bin/mv /etc/yum.repos.d/CentOS-* /etc/yum.repos.d/bak/;
done

