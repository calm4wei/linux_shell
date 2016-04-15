#!/usr/bin/gawk -f
BEGIN {
  net = "/inet/tcp/8080/0/0"    # 等待端口为8080

  for ( ; ; ) {
    print "listening..."

    while (net |& getline recv > 0)    # 接收1行
    print " - " recv               # 将接收到的字符串显示在终端上

    close(net)    # 关闭连接，等待下一个客户端
  }
}
