
### k8s部署
* https://xie.infoq.cn/article/c48dcdb43bb3c8c4263c8043f
* https://cloud.tencent.com/developer/article/1831389


#### 参考
* https://kubernetes.io/docs/concepts/services-networking/ingress/
* 


#### 快速部署
* http://docs.kubernetes.org.cn/468.html
* https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#run
```
kubectl run NAME --image=image [--env="key=value"] [--port=port] [--replicas=replicas] [--dry-run=bool] [--overrides=inline-json] [--command] -- [COMMAND] [args...]

kubectl create deployment NAME --image=image [--dry-run]
 
kubectl create deploy spring-service-server  --image=registry.cn-hangzhou.aliyuncs.com/wanghao4999/spring-service-server:v1 --replicas=1

docker build -t registry.cn-hangzhou.aliyuncs.com/wanghao4999/spring-client-server:v1.0 .


 
```
