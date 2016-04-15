#!/usr/bin/gawk -f
BEGIN {
  num = 2 ^ 200
  print num

  cmd = "bc"
  print "2 ^ 200" |& cmd      # 写入bc命令的标准输入
  cmd |& getline num          # 读取bc命令的标准输出
  print num
}
