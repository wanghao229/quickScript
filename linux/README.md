
#### 命令问题
* yum BDB1507 Thread died in Berkeley DB library
* https://www.cnblogs.com/xiaochina/p/8862700.html
```
　　01、删除yum临时库文件

　　　　rm -fr /var/lib/rpm/__db.*

　　02、重建rpm数据库

　　　　rpm --rebuilddb

　　03、清理缓存及生产yumdb缓存

　　　　yum clean all

　　　　yum makecache
```
