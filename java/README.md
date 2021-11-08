

### 参考
https://www.cnblogs.com/52lxl-top/p/9877202.html
```
yum install java-1.8.0-openjdk* -y
```


### 配置
/usr/lib/jvm

```

vim /etc/profile

#set java environment  

export JAVA_HOME=/usr/lib/jvm/java

export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/jre/lib/rt.jar

export PATH=$PATH:$JAVA_HOME/bin

```

### 生效
```
. /etc/profile

echo $JAVA_HOME  
echo $CLASSPATH

```


 

