#!/bin/bash

# 仅仅使用awk
echo "仅仅使用awk======================="
echo {1..10}  | 
awk '{for(i=1; i<=NF; i++) {printf $i*2 " "}; print ""}'

# 使用tr, awk组合命令整理数据
echo "使用tr, awk组合命令整理数据======="
echo {1..10}   		|
tr ' ' '\n'    		|
awk '{printf $1*2 " "}' | 
xargs


