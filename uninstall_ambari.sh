#!/bin/sh

#1.删除hdp.repo和hdp-util.repo
cd /etc/yum.repos.d/
rm -rf hdp*
rm -rf HDP*
rm -rf ambari*
#rm -rf ambari*
#2.删除安装包
#用yum list installed | grep HDP来检查安装的ambari的包
yum remove -y  sqoop.noarch  
yum remove -y  lzo-devel.x86_64  
yum remove -y  hadoop-libhdfs.x86_64  
yum remove -y  rrdtool.x86_64  
yum remove -y  hbase.noarch  
yum remove -y  pig.noarch  
yum remove -y  lzo.x86_64  
yum remove -y  ambari-log4j.noarch  
yum remove -y  oozie.noarch  
yum remove -y  oozie-client.noarch  
yum remove -y  gweb.noarch  
yum remove -y  snappy-devel.x86_64  
yum remove -y  hcatalog.noarch  
yum remove -y  python-rrdtool.x86_64  
yum remove -y  nagios.x86_64  
yum remove -y  webhcat-tar-pig.noarch  
yum remove -y  snappy.x86_64  
yum remove -y  libconfuse.x86_64    
yum remove -y  webhcat-tar-hive.noarch  
yum remove -y  ganglia-gmetad.x86_64  
yum remove -y  extjs.noarch  
yum remove -y  hive.noarch  
yum remove -y  hadoop-lzo.x86_64  
yum remove -y  hadoop-lzo-native.x86_64  
yum remove -y  hadoop-native.x86_64  
yum remove -y  hadoop-pipes.x86_64  
yum remove -y  nagios-plugins.x86_64  
yum remove -y  hadoop.x86_64  
yum remove -y  zookeeper.noarch      
yum remove -y  hadoop-sbin.x86_64  
yum remove -y  ganglia-gmond.x86_64  
yum remove -y  libganglia.x86_64  
yum remove -y  perl-rrdtool.x86_64
yum remove -y  epel-release.noarch
yum remove -y  compat-readline5*
yum remove -y  fping.x86_64
yum remove -y  perl-Crypt-DES.x86_64
yum remove -y  exim.x86_64
yum remove -y ganglia-web.noarch
yum remove -y perl-Digest-HMAC.noarch
yum remove -y perl-Digest-SHA1.x86_64
#3.删除快捷方式
cd /etc/alternatives
rm -rf hadoop-etc 
rm -rf zookeeper-conf 
rm -rf hbase-conf 
rm -rf hadoop-log 
rm -rf hadoop-lib 
rm -rf hadoop-default 
rm -rf oozie-conf 
rm -rf hcatalog-conf 
rm -rf hive-conf 
rm -rf hadoop-man 
rm -rf sqoop-conf 
rm -rf hadoop-conf
#4.删除用户
userdel ams
userdel nagios 
userdel hive 
userdel ambari-qa 
userdel hbase 
userdel oozie 
userdel hcat 
userdel mapred 
userdel hdfs 
userdel rrdcached 
userdel zookeeper 
userdel storm
userdel spark
userdel flume
userdel activity_analyzer

rm -rf /home/ams
rm -rf /home/nagios
rm -rf /home/hive
rm -rf /home/ambari-qa1
rm -rf /home/hbase
rm -rf /home/oozie
rm -rf /home/hcat
rm -rf /home/mapred
rm -rf /home/hdfs
rm -rf /home/storm
rm -rf /home/rrdcached
rm -rf /home/zookeeper
rm -rf /home/activity_analyzer
rm -rf /home/spark

#userdel mysql 
userdel sqoop
userdel puppet
#5.删除文件夹
rm -rf /etc/ambari-metrics-monitor

rm -rf /hadoop
rm -rf /etc/hadoop 
rm -rf /etc/hbase 
rm -rf /etc/hcatalog 
rm -rf /etc/hive 
rm -rf /etc/ganglia 
rm -rf /etc/nagios 
rm -rf /etc/oozie 
rm -rf /etc/sqoop 
rm -rf /etc/zookeeper 
rm -rf /var/run/ambari-metrics-monitor	
rm -rf /var/run/hadoop 
rm -rf /var/run/hbase 
rm -rf /var/run/hive 
rm -rf /var/run/ganglia 
rm -rf /var/run/nagios 
rm -rf /var/run/oozie
rm -rf /var/run/zookeeper
rm -rf /var/log/ambari-metrics-monitor	
rm -rf /var/log/hadoop 
rm -rf /var/log/hbase 
rm -rf /var/log/hive 
rm -rf /var/log/nagios 
rm -rf /var/log/oozie 
rm -rf /var/log/zookeeper 
rm -rf /usr/lib/hadoop
rm -rf /usr/lib/hbase 
rm -rf /usr/lib/hcatalog 
rm -rf /usr/lib/hive 
rm -rf /usr/lib/oozie 
rm -rf /usr/lib/sqoop 
rm -rf /usr/lib/zookeeper 
rm -rf /var/lib/hive 
rm -rf /var/lib/ganglia 
rm -rf /var/lib/oozie 
rm -rf /var/lib/zookeeper 
rm -rf /var/tmp/oozie 
rm -rf /usr/lib/flume	
rm -rf /usr/lib/storm	
rm -rf /tmp/hive 
rm -rf /tmp/nagios 
rm -rf /tmp/ambari-qa 
rm -rf /tmp/sqoop-ambari-qa 
rm -rf /var/nagios 
rm -rf /hadoop/oozie 
rm -rf /hadoop/zookeeper 
rm -rf /hadoop/mapred 
rm -rf /hadoop/hdfs 
rm -rf /tmp/hadoop-hive 
rm -rf /tmp/hadoop-nagios 
rm -rf /tmp/hadoop-hcat 
rm -rf /tmp/hadoop-ambari-qa 
rm -rf /tmp/hsperfdata_hbase 
rm -rf /tmp/hsperfdata_hive 
rm -rf /tmp/hsperfdata_nagios 
rm -rf /tmp/hsperfdata_oozie 
rm -rf /tmp/hsperfdata_zookeeper 
rm -rf /tmp/hsperfdata_mapred 
rm -rf /tmp/hsperfdata_hdfs 
rm -rf /tmp/hsperfdata_hcat 
rm -rf /tmp/hsperfdata_ambari-qa
#5.重置数据库，删除ambari包
#采用这句命令来检查yum list installed | grep ambari
ambari-server stop
ambari-agent stop
ambari-server reset
yum remove -y ambari-*
# yum remove -y postgresql
rm -rf /etc/yum.repos.d/ambari*
rm -rf /var/lib/ambari*
rm -rf /var/log/ambari*
rm -rf /etc/ambari*
