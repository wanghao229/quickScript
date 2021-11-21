
### Docker 安装
https://www.jenkins.io/zh/doc/book/installing/#%E5%9C%A8macos%E5%92%8Clinux%E4%B8%8A

```
docker run \
  -u root \
  --rm \
  -d \
  -p 8091:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins-1121
```


### Docker rename 

https://www.runoob.com/docker/docker-hello-world.html

docker rename 旧的容器名称或者容器id 新的的容器名称
