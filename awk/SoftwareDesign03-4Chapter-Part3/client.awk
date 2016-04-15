#!/usr/bin/gawk -f
{
  # 将从标准输入读取的内容直接发送至服务端
  # 目的地为localhost的8080端口
  print $0 |& "/inet/tcp/0/localhost/8080"
}
