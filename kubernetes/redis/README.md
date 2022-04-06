

### 安装
#### redis集群
* https://juejin.cn/post/6844903806719754254 完整，80%
* Centos7.6部署k8s v1.16.4高可用集群(主备模式), https://www.kubernetes.org.cn/6632.html, 60%

#### redis-cluster-proxy
* https://blog.csdn.net/weixin_40449300/article/details/111407611 80%
* 

#### 使用
* Redis 5.0 redis-cli --cluster help说明 , https://www.cnblogs.com/zhoujinyi/p/11606935.html
```
redis-cli --cluster fix 0.0.0.0:6379 --cluster-search-multiple-owners
```

#### Slots
* redis集群，添加删除槽, https://www.cnblogs.com/xmxkkk/p/8038190.html 60^
```
for i in {12915..16383};do redis-cli -h 10.32.0.6 cluster  delslots $i;done

for i in {0..5460}; do echo $i;redis-cli -h 10.46.0.11 cluster addslots $i;done
for i in {5461..10921}; do echo $i;redis-cli -h 10.39.0.7 cluster addslots $i;done
for i in {10922..16383}; do echo $i;redis-cli -h 10.32.0.6 cluster addslots $i;done

```

#### 分析redis key大小的几种方法
* https://cloud.tencent.com/developer/article/1757281
```
1. redis-cli -h b.redis -p 1959 --bigkeys

2. rdb -c memory file
bgsave

3. debug object a

```

### 问题

#### 集群外如何访问
* redis-cluster-proxy



