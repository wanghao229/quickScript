
### 安装

#### minikube
* https://minikube.sigs.k8s.io/docs/start/


#### Dashboard
* https://www.cnblogs.com/liyuanhong/p/13799404.html

```

minikube dashboard
kubectl proxy --port=8001 --address='0.0.0.0' --accept-hosts='^.*' &

```
 
#### 卸载
* https://segmentfault.com/a/1190000039173195
```
minikube stop; minikube delete
docker stop (docker ps -aq)
rm -r ~/.kube ~/.minikube
sudo rm /usr/local/bin/localkube /usr/local/bin/minikube
systemctl stop '*kubelet*.mount'
sudo rm -rf /etc/kubernetes/
docker system prune -af --volumes
```
