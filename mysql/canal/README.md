

### 安装
* https://github.com/alibaba/canal/wiki/Docker-QuickStart
 

### 运行
*  https://github.com/alibaba/canal/blob/master/docker/run.sh

```
run.sh -e canal.instance.master.address=dbhost:3306 \
         -e canal.instance.dbUsername=canal \
         -e canal.instance.dbPassword=wang \
         -e canal.instance.connectionCharset=UTF-8 \
         -e canal.instance.tsdb.enable=true \
         -e canal.instance.gtidon=false \
         -e canal.instance.filter.regex=.*\\..* 
```
