

### 参考
* https://www.cnblogs.com/zzhaolei/p/11067786.html



### 用户
```
useradd -M -s /sbin/nologin elasticsearch
chmod -R elasticsearch.elasticsearch elasticsearch

sudo -u elasticsearch elasticsearch/bin/elasticsearch -d

```

```
vi .bashrc
sudo -u elasticsearch /usr/share/elasticsearch/bin/elasticsearch -d
```
