#!/usr/bin/awk -f
function getkey(    dd_cmd, key) {
  # 使用dd命令取得按下的按键
  dd_cmd = "dd bs=1 count=1 2>/dev/null"
  dd_cmd | getline key
  close(dd_cmd)    # 取得按下的按键后关闭
  return  key
}

BEGIN {
  system("stty raw -echo")    # 关闭终端的Buffering以及Echo

  for ( ; ; ) {
    key = getkey()          # 取得按下的按键

    # 在遇到不可读字符时，这里将其转换为相应的字符串
    if (key == "\n" || key == "\r")
      key = "Enter"
    else if (key == " ")
      key = "Space"
    else if (key == "\t")
      key = "Tab"
    else if (key == "\033")
      key = "Escape"

    print "You hit [", key, "]."    # 显示按下的按键
    printf "\r"    # 由于终端的我们修改了终端的设定，输入\r将光标置于行首

    if (key == "q") exit 0    # 如果按下的按键为'q'则退出
  }
}

END {
  # 在退出前恢复终端的设定（开启Buffering以及echo）
  system("stty cooked echo")
  print "exit..."
}
