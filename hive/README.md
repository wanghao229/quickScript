 

## 安装
#### Docker
* https://www.cnblogs.com/upupfeng/p/13452385.html, docker 搭建
* https://github.com/big-data-europe/docker-hive


#### 二进制文件安装

```
sudo vi /etc/profile

#Hive
export HIVE_HOME=/usr/local/apache-hive-3.1.3
export PATH=$PATH:$HIVE_HOME/bin
export CLASSPATH=$CLASSPATH:$HIVE_HOME/bin
```

##### Mysql
* https://www.lilinchao.com/archives/1693.html 
```
bin/schematool -dbType derby -initSchema
```



## 问题
##### java.net.URISyntaxException when starting HIVE
* https://stackoverflow.com/questions/27099898/java-net-urisyntaxexception-when-starting-hive

