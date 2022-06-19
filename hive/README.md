 

## 安装
#### Docker
* https://www.cnblogs.com/upupfeng/p/13452385.html, docker 搭建
* https://github.com/big-data-europe/docker-hive

#### 二进制文件安装

* https://blog.csdn.net/zheng911209/article/details/105413578
* https://www.cnblogs.com/shishanyuan/p/4721403.html 80%

```shell

cd /usr/local/apache-hive-3.1.3/conf
 
cp hive-env.sh.template  hive-env.sh
 
cp hive-default.xml.template hive-site.xml

```

```shell
sudo vi /etc/profile

#Hive
export HIVE_HOME=/usr/local/apache-hive-3.1.3
export PATH=$PATH:$HIVE_HOME/bin
export CLASSPATH=$CLASSPATH:$HIVE_HOME/bin
```

```
nohup hive --service metastore &

nohup hive --service hiveserver &

```



##### Mysql

* https://www.lilinchao.com/archives/1693.html 
```shell
bin/schematool -dbType derby -initSchema
```



## 问题
##### java.net.URISyntaxException when starting HIVE
* https://stackoverflow.com/questions/27099898/java-net-urisyntaxexception-when-starting-hive


#### java.lang.RuntimeException: Unable to instantiate org.apache.hadoop.hive.ql.metadata.SessionHiveMetaStoreClient
* https://stackoverflow.com/questions/35449274/java-lang-runtimeexception-unable-to-instantiate-org-apache-hadoop-hive-ql-meta
* hive --service metastore & 



#### OutOfMemoryError

* https://aws.amazon.com/cn/premiumsupport/knowledge-center/emr-hive-outofmemoryerror-heap-space/#:~:text=Short%20description,the%20JVM%20or%20increase%20HADOOP_HEAPSIZE.

* ```
  /etc/hive/conf/hive-env.sh
  export HADOOP_HEAPSIZE=2048
  ```



#### 错误: 找不到或无法加载主类org.apache.hadoop.mapreduce.v2.app.MRAppMaster

* https://blog.csdn.net/qq_41684957/article/details/81710190
* hadoop classpath







