#!/bin/bash

# config ntp
for i in `cat /etc/hosts | awk '{print $1}'`; do scp -r /etc/ntp.conf  root@$i:/etc/; done

# config selinux
for i in `cat /etc/hosts | awk '{print $1}'`; do scp -r /etc/selinux/config root@$i:/etc/selinux/; done

