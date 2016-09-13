#!/bin/bash

for i in `cat /etc/hosts |grep datacube2 |awk '{print $2}'`; 
do 
    scp -r /etc/yum.repos.d/bak/lan.repo root@$i:/etc/yum.repos.d/;
done

