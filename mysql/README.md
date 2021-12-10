
### 教程
https://www.cnblogs.com/sablier/p/11605606.html


### Docker 安装

```
docker run -p 3306:3306 --name mysql \
-v /usr/local/docker/mysql/conf:/etc/mysql \
-v /usr/local/docker/mysql/logs:/var/log/mysql \
-v /usr/local/docker/mysql/data:/var/lib/mysql \
-v /home/mysql/mysql-files:/var/lib/mysql-files/ \
-e MYSQL_ROOT_PASSWORD=123456 \
-d mysql

```

### 迁移数据库
```
mysql -uroot -p -e "select concat('rename table cms_three.',table_name,' to cms.',table_name,';') from information_schema.TABLES where TABLE_SCHEMA='cms_three';" > rename_mysql_name.sql

sed -i '1d' rename_mysql_name.sql

```

### 备份策略
* 本机，远程机器双备份。

