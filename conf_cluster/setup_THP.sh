#!/bin/bash

/bin/echo never > /sys/kernel/mm/redhat_transparent_hugepage/defrag  
/bin/echo never > /sys/kernel/mm/redhat_transparent_hugepage/enabled  
/bin/echo never > /sys/kernel/mm/transparent_hugepage/enabled  
/bin/echo never > /sys/kernel/mm/transparent_hugepage/defrag  
