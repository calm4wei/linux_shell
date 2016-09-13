#!/bin/bash
for i in `cat /etc/hosts | grep 192.168.6 | awk '{print $1}'`; do scp -r /etc/hosts root@$i:/etc/ ;done
