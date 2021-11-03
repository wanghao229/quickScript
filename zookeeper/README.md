
```
docker pull zookeeper
docker pull wurstmeister/kafka
```


```
docker run -d --name zookeeper -p 2181:2181 -v /usr/local/docker/zookeeper/data:/data -v /usr/local/docker/zookeeper/log:/datalog zookeeper

```