
### ·备注
* 可以一次安装，然后打包成Docker使用
* 不需要存储数据，GOOD


#### 安装
* https://cloud.tencent.com/developer/article/1711159 80%
* https://hadoop.apache.org/docs/r1.0.4/cn/quickstart.html 30%



```
wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.3/hadoop-3.3.3.tar.gz

#HADOOP_HOME
export HADOOP_HOME=/usr/local/hadoop-3.3.3
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

```

```
yum install -y java-1.8.0-openjdk-devel.x86_64

sudo rm -rf tmp/dfs
mkdir -p tmp/dfs/data

hadoop namenode -format
```

```
cd /usr/local/hadoop-3.3.3/sbin

./start-dfs.sh
./start-yarn.sh

```

#### 文件配置
```shell
vi  core-site.xml
<configuration>
    <property>
        <name>hadoop.tmp.dir</name>
        <value>file:/usr/local/hadoop-3.3.3/tmp</value>
        <description>Abase for other temporary directories.</description>
    </property>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://0.0.0.0:9000</value>
    </property>
</configuration>


vi hdfs-site.xml
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
    <property>
        <name>dfs.namenode.name.dir</name>
        <value>file:/usr/local/hadoop-3.3.3/tmp/dfs/name</value>
    </property>
    <property>
        <name>dfs.datanode.data.dir</name>
        <value>file:/usr/local/hadoop-3.3.3/tmp/dfs/data</value>
    </property>
</configuration>
```




### 问题
#### ERROR: Attempting to operate on hdfs namenode as root
```
export HDFS_NAMENODE_USER="root"
export HDFS_DATANODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"
export YARN_RESOURCEMANAGER_USER="root"
export YARN_NODEMANAGER_USER="root"
```

#### Hadoop : Permission denied (publickey,password, keyboard-interactive)
* https://askubuntu.com/questions/724523/permission-denied-on-start-dfs-sh
```
$ ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
$ cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
$ chmod 0600 ~/.ssh/authorized_keys
```



#### 执行start-dfs.sh后，datenode没有启动的解决办法

* https://blog.csdn.net/zimojiang/article/details/80725084#:~:text=%E6%89%A7%E8%A1%8Cstart%2Ddfs.sh%E5%90%8E%EF%BC%8Cdatenode%E6%B2%A1%E6%9C%89%E5%90%AF%E5%8A%A8%EF%BC%8C,%E4%BF%9D%E6%8C%81%E4%B8%8D%E5%8F%98%E5%AF%BC%E8%87%B4%E7%9A%84

  







