
### 安装
https://www.runoob.com/docker/centos-docker-install.html

```
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/centos/docker-ce.repo
    
sudo yum install docker-ce docker-ce-cli containerd.io
 
```


### 配置加速
```
sudo systemctl daemon-reload
sudo systemctl restart docker
```

```
vi  /etc/docker/daemon.json

{ 
"registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"] 
}
```



#### 关闭Docker

* https://zhuanlan.zhihu.com/p/451344803
* 
