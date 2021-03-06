### 计算学分 ###

#!/bin/bash

# 从第二行取所有记录
tail -n +2 test_result					|
# 若分数超过60分， 则在$4中记录1个学分
gawk '{p=($2>=60)?1:0; p+=($3>=60)?1:0; print $0,p}'	|
# 若两项科目分数和超过140分，则修改为两个学分
gawk '{$4=($2+$3>=140)?2:$4; print}'

