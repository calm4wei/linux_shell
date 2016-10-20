<<!
 **********************************************************
 * Author        : feng.wei
 * Email         : alferwei98@163.com
 * Last modified : 2016-10-20 11:32
 * Filename      : count_down.sh
 * Description   : 倒计时
 * *******************************************************
!

#!/bin/sh

for j in `seq -w 10 -1 1`
do
	echo -ne "\033[s\033[k$j\033[u"
	sleep 0.5
done
