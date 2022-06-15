
---
### 步骤
1. 安装
2. 压测
3. 自己使用


#### Docker安装
* https://www.jianshu.com/p/c971d5c21633
* https://blog.csdn.net/qq_42996037/article/details/91343636

#### 物理机安装

* 下载：https://hbase.apache.org/downloads.html
* 版本兼容：https://hbase.apache.org/book.html#hadoop
* 安装：
* https://blog.csdn.net/heiren_a/article/details/108176504 70%
* https://www.imooc.com/article/308694/ 50%
* 
* https://blog.51cto.com/StarBigData/3643760 



```shell
export HBASE_HOME=/usr/app/hbase-2.4.12
export PATH=$HBASE_HOME/bin:$PATH

source /etc/profile

```

* 本机安装

```
vi conf/hbase-site.xml

<configuration>
 <property>
    <name>hbase.rootdir</name>
    <value>file:///home/hbase/rootdir</value>
  </property>
  <property>
    <name>hbase.zookeeper.property.dataDir</name>
    <value>/home/zookeeper/dataDir</value>
  </property>
  <property>
    <name>hbase.unsafe.stream.capability.enforce</name>
    <value>false</value>
  </property>
  
  <property>
 		<name>hbase.master.info.port</name>
	 <value>60010</value> # 使用 master 节点 60010 端口
 </property>

</configuration>

```

* 启动

```
start-hbase.sh

hbase shell

```

* zk启动慢，需要==执行两次==。




#### SpringBoot
* https://www.jianshu.com/p/e5bcf8ba5128

---
### 命令

* http://c.biancheng.net/view/6530.html

#### SCAN
* https://generalthink.github.io/2018/12/17/hbase-scan-command/


---
### 实用
#### RowKey的散列和预分区设计
* https://www.cnblogs.com/bdifn/p/3801737.html 

---
### 问题
#### 1. Call to address=myhbase/127.0.0.1:16020 failed
* https://blog.csdn.net/qqHJQS/article/details/96628601
```
docker pull harisekhon/hbase

docker run -d -h myhbase \
        -p 2181:2181 \
        -p 8080:8080 \
        -p 8085:8085 \
        -p 9090:9090 \
        -p 9000:9000 \
        -p 9095:9095 \
        -p 16000:16000 \
        -p 16010:16010 \
        -p 16201:16201 \
        -p 16301:16301 \
        -p 16020:16020\
        --name hbase \
        harisekhon/hbase
```



#### 2. java.lang.IllegalArgumentException: object is not an instance of declaring class

* hbase與hadoop版本兼容問題，強烈譴責hadoop生態圈耦合性

* https://www.uj5u.com/qita/391416.html





