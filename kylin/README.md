## 安装

#### 安装

* 官网：https://kylin.apache.org/cn/development/dev_env.html ，官网，30%
* 文档：https://kylin.apache.org/cn/docs/
* 下载：https://kylin.apache.org/download/，
* 参考：https://juejin.cn/post/6844903657218310151，50%
* 基于 MySQL 的 Metastore 配置,https://kylin.apache.org/cn/docs31/tutorial/mysql_metastore.html
* 参考：[Apache Kylin 部署之不完全指南 ](https://www.cnblogs.com/en-heng/p/5170876.html) 30%

#### Support Hadoop Version Matrix of Kylin 4

* https://cwiki.apache.org/confluence/display/KYLIN/Support+Hadoop+Version+Matrix+of+Kylin+4





## 使用

#### 使用

* 使用SQL： https://blog.csdn.net/qq_35779794/article/details/109895958 80%



#### SAMPLE

* https://kylin.apache.org/docs/tutorial/kylin_sample.html



## 问题

#### 1.NoClassDefFoundError: org/apache/commons/configuration/ConfigurationE

* https://blog.csdn.net/wzh8108/article/details/105239984
* 需要复制spark/jars/commons-configuration-1.6.jar文件到tomcat/lib下，启动成功

#### 2.排查文件参考

* $KYLIN_HOME/logs目录的kylin.log和kylin.out

#### 3.Cannot start job scheduler due to lack of job lock

* https://romandata.github.io/2020/08/15/Apache-Kylin/Apache-Kylin%E5%88%9D%E6%8E%A2/

#### 4.should not be the root cause of XXX

* 反思

#### 5.Unable to resolve address: sandbox.hortonworks.com:2181

* 127.0.0.1 sandbox.hortonworks.com

#### 6.File does not exist ....... fairscheduler.xml

* https://lists.apache.org/thread/s7jnslsp79tvl71p07jbz00kpg96qm72

#### 7.[curl with Kerberos error: option --negotiate: the installed libcurl version doesn't support this](https://stackoverflow.com/questions/45148521/curl-with-kerberos-error-option-negotiate-the-installed-libcurl-version-does)

* https://stackoverflow.com/questions/45148521/curl-with-kerberos-error-option-negotiate-the-installed-libcurl-version-does







