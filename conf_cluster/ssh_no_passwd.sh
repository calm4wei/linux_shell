#!/bin/bash

USER=`whoami`
for i in `cat /etc/hosts | grep datacube15 | awk '{print $1}'`; do ssh-copy-id -i ~/.ssh/id_rsa.pub $USER@$i ;done
