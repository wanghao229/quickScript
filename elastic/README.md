
### 安装
安装
* https://cloud.tencent.com/developer/article/1625296

修改JVM
* https://www.cnblogs.com/zzhaolei/p/11067786.html

Docker
* docker run --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e ES_JAVA_OPTS="-Xms256m -Xmx256m"  -d elasticsearch:7.14.2


### 使用
```
useradd -M -s /sbin/nologin elasticsearch
chmod -R elasticsearch.elasticsearch /usr/share/elasticsearch
sudo -u elasticsearch /usr/share/elasticsearch/bin/elasticsearch -d
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

```
docker run -d --name=logstash logstash:6.8.20
docker logs -f logstash

docker cp logstash:/usr/share/logstash /data/elk6/
mkdir /data/elk6/logstash/config/conf.d
chmod 777 -R /data/elk6/logstash

docker exec -u 0 -it logstash bash

chmod 644 /var/log/messages
chmod 644 /var/log/secure

```


### Support Matrix
* https://www.elastic.co/cn/support/matrix#matrix_compatibility

