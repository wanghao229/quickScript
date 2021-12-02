

### 参考
* https://www.cnblogs.com/zzhaolei/p/11067786.html



### 使用
```
useradd -M -s /sbin/nologin elasticsearch
chmod -R elasticsearch.elasticsearch elasticsearch
sudo -u elasticsearch elasticsearch/bin/elasticsearch -d
```
```
vi config/jvm.options
-Xms256m
-Xmx256m
```

### 快捷方式
```
vi .bashrc
sudo -u elasticsearch /usr/share/elasticsearch/bin/elasticsearch -d
```

### kibana
* https://www.elastic.co/guide/en/kibana/6.8/docker.html#bind-mount-config


### LogStach
* https://cloud.tencent.com/developer/article/1703928

