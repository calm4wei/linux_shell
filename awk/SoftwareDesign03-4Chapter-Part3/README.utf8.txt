*** 压缩包简介 ***

本压缩包包含了 《Software Design中文版》03期的特辑【UNIX工程师的喜好 从现在开始sed/AWK再入门】中第4章Part3【深入AWK编程】的全部示例程序。

============ 免责声明 ============

本压缩包中的示例程序不论商用或者非商用，都可以自由使用。

但是，对于使用本压缩包内的示例程序以及其派生程序造成的一切损失，笔者、译者、技术评论社、人民邮电出版社、图灵文化发展有限公司概不负责。


*** 示例程序一览 ***

本压缩包包含了如下7个文件以及1个目录。

get_key.awk
、server.awk、
client.awk、
bc.awk、
tst.awk、
1.awk、
print.awk、
awkmine/

下面简单介绍一下各个文件。

* get_key.awk、serve.awk、client.awk 这3个文件在正文中已经进行了讲解，在这里就不再特别说明了。
* bc.awk 是将正文图5中的单行脚本程序，在这里保存为了Shell脚本。
* tst.awk 是正文中图7调试的例子中所使用的程序。
* 1.awk以及print.awk 是正文中图9导出字节码时使用的程序。
* awkmine将在下面介绍。

*** AwkMine ***

awkmine目录收录了和AwkMine相关的文件，它包含下面3个文件。

awkmine
、awkmine.awk
、lib_term.awk、

awkmine.awk是AwkMine的主程序，lib_term.awk包含一些操作终端的库函数。
awkmine.awk调用了lib_term.awk中的函数。

另外，lib_term.awk中，除了包含AwkMine需要使用的功能外，还包括了许多AWK操作终端的功能，大家在自己编写程序时也可以自由地进行使用。

要执行AwkMine，只需输入如下命令。$表示Shell提示符。

$ awk -f awkmine.awk -f lib_term.awk

每次执行都要输入上述命令的话会十分麻烦，awkmine就是将上述命令作为Shell脚本的一个文件。


【AwkMine执行环境相关的注意事项】

* 由于AwkMine并没有使用任何特殊功能，所以应该可以运行在任何AWK实现中。
  至少可以确认的有 nawk、mawk、gawk。

* 因为AwkMine在执行时需要调用stty和dd这两个外部命令，所以必须在存在这两个命令的环境中执行。
  Unix系的操作系统（Linux、*BSD、Mac OS X等）是没有问题的，Windows中必须使用Cygwin等工具。

* 同时，AwkMine需要在对应VT100转义序列的终端上执行。
  Mac OS X上的Terminal，其他Unix系操作系统中的xterm、mlterm、gnome-terminal都是可以的。
  （即使是上述以外的终端，但只要是现在Unix系操作系统使用的，就几乎没有哪一个是不对应VT100转义序列的）
  由于Windows的命令行提示符是不对应VT100转义序列的，因此需要使用Cygwin附带的mintty。

* 虽然现在基本上已经不再使用了，但是少数AWK并不接受-f选项。
  如果正在使用这样的AWK实现，请像下面这样将文件连接后再执行。
  $表示Shell提示符。

$ cat awkmine.awk lib_term.awk > awkmine2.awk
$ chmod +x awkmine2.awk
$ awk -f awkmine2.awk
