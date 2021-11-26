 
### Dubbo Admin
* https://dubbo.apache.org/zh/docsv2.7/admin/install/admin-console/

* https://github.com/apache/dubbo-admin

```
git clone https://github.com/apache/dubbo-admin.git /var/tmp/dubbo-admin
cd /var/tmp/dubbo-admin
mvn clean package -Dmaven.test.skip=true

```

### 配置文件为：
```
dubbo-admin-server/src/main/resources/application.properties
主要的配置有：
admin.registry.address=zookeeper://127.0.0.1:2181
admin.config-center=zookeeper://127.0.0.1:2181
admin.metadata-report.address=zookeeper://127.0.0.1:2181
```

### 启动
> mvn --projects dubbo-admin-server spring-boot:run

