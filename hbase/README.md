
#### 步骤
1. 安装
2. 压测
3. 自己使用


#### 安装
* https://www.jianshu.com/p/c971d5c21633
* https://blog.csdn.net/qq_42996037/article/details/91343636


#### SpringBoot
* https://www.jianshu.com/p/e5bcf8ba5128


### 问题
#### Call to address=myhbase/127.0.0.1:16020 failed
* https://blog.csdn.net/qqHJQS/article/details/96628601
```
docker pull harisekhon/hbase

docker run -d -h myhbase \
        -p 2181:2181 \
        -p 8080:8080 \
        -p 8085:8085 \
        -p 9090:9090 \
        -p 9000:9000 \
        -p 9095:9095 \
        -p 16000:16000 \
        -p 16010:16010 \
        -p 16201:16201 \
        -p 16301:16301 \
        -p 16020:16020\
        --name hbase \
        harisekhon/hbase
```
