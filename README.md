# quickScript

 
# linux


### command
```
yum install telnet -y 
yum install java-1.8.0-openjdk* -y
yum install tree -y 
yum install jq -y
yum install -y nc
yum install -y netcat
yum install -y epel-release
yum install stress -y
find / -type -f -size +100m
```
### 脚本
```
#!/bin/bash
source /etc/profile
...
```

### ssh
```
echo export TMOUT=1000000 >> /root/.bash_profile; source .bash_profile
```

```

sudo curl -L "https://github.com/docker/compose/releases/download/v2.1.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose --version

```

### 用户
```
useradd -m username
passwd username
usermod -G wheel username

```


### kafak
单个部署：https://www.hangge.com/blog/cache/detail_2791.html 质量高

集群部署：https://www.cnblogs.com/kendoziyu/p/15134041.html 质量高
```
docker run -itd --name=kafka-manager -p 9000:9000 sheepkiller/kafka-manager
-e ZK_HOSTS="101.34.168.240:2181" 
```



### hbase
单个：https://cloud.tencent.com/developer/article/1632053 质量高
集群：


### linux
```
vi ~/.bashrc
alias wy='cd /home/wyatt'
source .bashrc
```
```
vi /etc/hosts

ip地址 主机名

hostname

systemctl restart network

```

### mac
```
vi .bash_profile

alias doc='cd /Users/a11080178/Documents'

source .bash_profile

```

### Docker
* docker update --restart=always 

