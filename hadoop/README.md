
### 备注
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
hdfs namenode -format
```

```
start-dfs.sh
```

#### 文件配置
```
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

