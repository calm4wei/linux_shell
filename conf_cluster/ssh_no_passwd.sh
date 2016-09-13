#!/bin/bash

for i in `cat /etc/hosts | grep 20 | awk '{print $1}'`; do ssh-copy-id -i ~/.ssh/id_rsa.pub root@$i ;done
