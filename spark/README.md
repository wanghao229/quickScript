
### 安装
#### 安装教程
* https://www.cnblogs.com/shishanyuan/p/4699644.html 80%
* 


```
#SPARK
export SPARK_HOME=/usr/local/spark-3.2.1-bin-hadoop3.2
export PATH=$PATH:$SPARK_HOME/bin

spark-shell --master spark://192.168.1.3:7077 --executor-memory 1024m --driver-memory 1024m

```

```

start-dfs.sh

cd /usr/local/spark-3.2.1-bin-hadoop3.2

./start-all.sh

```

#### JAR
```
spark-submit --master spark://192.168.1.3:7077 --class class3.SogouResult --executor-memory 1g spark-demo-one.jar hdfs://localhost:9000/sogou/SogouQ1.txt hdfs://localhost:9000/class3/output3
```



#### Spark SQL

```
bin/spark-sql --master spark://hadoop1:7077 --executor-memory 1g
```





#### 动态修改Docker端口

* https://www.jianshu.com/p/6aefed2be1c7
* 





#### 使用教程
* https://www.cnblogs.com/shishanyuan/p/4721102.html
* 实验集，http://www.sogou.com/labs/resource/list_yuliao.php


#### 字符频数统计
* https://tellyouwhat.cn/p/docker-build-spark-wordcount-app/

### 问题

#### tty. No such file or directory
* mac docker ~/Library/Containers/com.docker.docker/Data/vms/0/tty: No such file or directory解决办法
* https://blog.csdn.net/m0_38112165/article/details/120116336
* 

