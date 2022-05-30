
## 安装
安装

* https://cloud.tencent.com/developer/article/1625296
* https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html

修改JVM
* https://www.cnblogs.com/zzhaolei/p/11067786.html



#### 1.1 Docker

```
docker run --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e ES_JAVA_OPTS="-Xms256m -Xmx256m"  -d elasticsearch:7.14.2

docker network create elastic
docker run --name es01 --net elastic -p 9200:9200 -p 9300:9300 -it docker.elastic.co/elasticsearch/elasticsearch:8.2.2



docker run --name es01 --net elastic -p 9200:9200 -p 9300:9300 \
-e "discovery.type=single-node" \
-e ES_JAVA_OPTS="-Xms64m -Xmx128m" \
-v ~/Documents/es-1/data:/usr/share/elasticsearch/data \
-v ~/Documents/es-1/plugins:/usr/share/elasticsearch/plugins \
 -itd docker.elastic.co/elasticsearch/elasticsearch:8.2.2
 
 
 
 -v ~/Documents/es-1/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
```



#### 1.2重置密码

* bin/elasticsearch-reset-password -u elastic
  * New value: oZui4FId-ebc2sT=uJ3n
* ./elasticsearch-setup-passwords interactive
* https://blog.csdn.net/qq_41070393/article/details/120386313



#### 1.3 单机映射文件

* https://blog.csdn.net/qq_27991405/article/details/109361136
* 

## 使用

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

## 快捷方式
```
vi .bashrc
sudo -u elasticsearch /usr/share/elasticsearch/bin/elasticsearch -d
```

## kibana
* https://www.elastic.co/guide/en/kibana/6.8/docker.html#bind-mount-config


## LogStach
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


## Support Matrix
* https://www.elastic.co/cn/support/matrix#matrix_compatibility

