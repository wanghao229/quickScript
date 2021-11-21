

### 安装
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
