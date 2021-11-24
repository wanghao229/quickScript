
### 安装
https://www.runoob.com/docker/centos-docker-install.html


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
