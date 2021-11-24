

### 教程
* https://blog.csdn.net/yy756127197/article/details/107458943
* https://www.jianshu.com/p/5524b4545421

### 安装

```
wget https://archive.apache.org/dist/skywalking/8.7.0/apache-skywalking-apm-8.7.0.tar.gz

tar -zxf apache-skywalking-apm-8.7.0.tar.gz
mkdir /usr/local/skywalking
mv apache-skywalking-apm-bin/ /usr/local/skywalking

```

**配置文件**
* agent/config/agent.config
* conf/application.yml
* webapp/webapp.yml

```
storage:
   selector: ${SW_STORAGE:elasticsearch7}
   elasticsearch7:
      # elasticsearch 的集群名称
      nameSpace: ${SW_NAMESPACE:"TEST-ES"}
 
      # elasticsearch 集群节点的地址及端口
      clusterNodes: ${SW_STORAGE_ES_CLUSTER_NODES:192.168.1.1:9200}

```
