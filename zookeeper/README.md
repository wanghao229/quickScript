
#### ZK安装
```
docker pull zookeeper
docker pull wurstmeister/kafka
```


```
docker run -d --name zookeeper -p 2181:2181 -v /usr/local/docker/zookeeper/data:/data -v /usr/local/docker/zookeeper/log:/datalog zookeeper

```


#### Kafka安装
https://www.hangge.com/blog/cache/detail_2791.html
```
docker run -d --name kafka --publish 9092:9092 \
--link zookeeper \
--env KAFKA_ZOOKEEPER_CONNECT=101.34.168.240:2181 \
--env KAFKA_ADVERTISED_HOST_NAME=101.34.168.240 \
--env KAFKA_ADVERTISED_PORT=9092  \
--env KAFKA_LOG_DIRS=/kafka/kafka-logs-1 \
-v /usr/local/docker/kafka/logs:/kafka/kafka-logs-1  \
wurstmeister/kafka
```