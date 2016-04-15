### Foreground Color ###

# 将字符的颜色修改为color指定的颜色
function term_fg_color(color) {
  if (color == "black") {
    printf "\033[30m"
  } else if (color == "red") {
    printf "\033[31m"
  } else if (color == "green") {
    printf "\033[32m"
  } else if (color == "yellow") {
    printf "\033[33m"
  } else if (color == "blue") {
    printf "\033[34m"
  } else if (color == "magenta") {
    printf "\033[35m"
  } else if (color == "cyan") {
    printf "\033[36m"
  } else if (color == "white") {
    printf "\033[37m"
  }
  return
}


### Background Color ###

# 将背景的颜色修改为color指定的颜色
function term_bg_color(color) {
  if (color == "black") {
    printf "\033[40m"
  } else if (color == "red") {
    printf "\033[41m"
  } else if (color == "green") {
    printf "\033[42m"
  } else if (color == "yellow") {
    printf "\033[43m"
  } else if (color == "blue") {
    printf "\033[44m"
  } else if (color == "magenta") {
    printf "\033[45m"
  } else if (color == "cyan") {
    printf "\033[46m"
  } else if (color == "white") {
    printf "\033[47m"
  }
  return
}


### Attribute ###

# 将字符修改为粗体
function term_bold() {
  printf "\033[01m"
}

# 调换字符的颜色和背景色
function term_reverse() {
  printf "\033[07m"
}

# 重置字符的属性（颜色以及粗细等）
function term_atr_reset() {
  printf "\033[00m"
}


### Cursor Move ###

# 将光标向上移动n行
function term_cursor_up(n) {
  printf "\033[%dA", n
}

# 将光标向下移动n行
function term_cursor_down(n) {
  printf "\033[%dB", n
}

# 将光标向左移动n行
function term_cursor_left(n) {
  printf "\033[%dD", n
}

# 将光标向右移动n行
function term_cursor_right(n) {
  printf "\033[%dC", n
}

# 将光标移动到row指定的行，col指定的列
function term_cursor_move(row, col) {
  printf "\033[%d;%dH", row, col
}


### Cursor Control ###

# 不显示光标
function term_hidden_cursor() {
  printf "\033[>5h"
}

# 显示光标
function term_show_cursor() {
  printf "\033[>5l"
}


### Key Input ###

# 读入一个字符的按键输入
function term_getkey(    key) {
  "dd bs=1 count=1 2>/dev/null" | getline key
  close("dd bs=1 count=1 2>/dev/null")
  return  key
}


### Miscellaneous ###

# 清除画面
function term_clear() {
  printf "\033[2J"
}

function term_init() {
  system("stty raw -echo")
  term_clear()
  term_cursor_move(1, 1)
}

function term_finish() {
  term_atr_reset()
  system("stty cooked echo")
}
