#!/bin/sh

echo "start..."

i=0

while [ $i -lt 10 ]
do
	    for j  in  '-' '\\' '|' '/'
	    do
		        #tput  sc                        #保存当前光标所在位置
		        #echo -ne  "Please waiting ... .... $j"
				echo -ne "\033[2J"
				#clear
				echo -ne "$j"
		        sleep 0.1
		        #tput rc                           #恢复光标到最后保存的位置
	    done
	    ((i++))
done


echo "end..."
