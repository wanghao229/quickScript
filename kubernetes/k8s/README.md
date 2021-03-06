

### 教程
#### 高可用
* http://pigpi.cn/58749.html
* Port, https://documentation.sisense.com/docs/linux-port-settings#gsc.tab=0

#### 部署
* https://segmentfault.com/a/1190000040132460
* http://pigpi.cn/58749.html , Kubeadm快速部署Kubernetes集群
* 多Master还需要负载均衡




#### NGINX Ingress Controller
* https://kubernetes.github.io/ingress-nginx/deploy/
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/cloud/deploy.yaml
```

#### 退出k8s
* https://blog.csdn.net/qq_25268789/article/details/103843505


#### containerPort
* https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.19/#containerport-v1-core

---
### 网络
#### LoadBalancer
* https://zhuanlan.zhihu.com/p/266422557 GOOD
* https://metallb.universe.tf/installation/
* MetalLB 
```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```

#### Ingress
* https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource

#### IPVS
* https://zhuanlan.zhihu.com/p/94418251


---
### 问题排查
#### DNS排查
* http://www.mydlq.club/article/78/

#### How to fix CrashLoopBackOff kubernetes error
* https://komodor.com/learn/how-to-fix-crashloopbackoff-kubernetes-error/#:~:text=If%20you%20get%20the%20back,window%20of%20time%20to%20respond.

#### Kubernetes load balancer External IP pending
*

---
### 域名
```
    访问Pod:(注意下面不是直接pod的ip,而是由pod的ip组成的字符串)
    {pod-ip}.{namespace}.pod.cluster.local
  例如某pod的ip为  1.2.3.4,在命名空间default与DNS名称cluster.local将有一个域名：1-2-3-4.default.pod.cluster.local。

    {hostname}.{subdomain}.{namespace}.svc.cluster.local
    subdomain是在创建pod设定的属性,和hostname可以一起设置
    
    访问StatefulSet:
    {pod-name}.{service-name}.{namespace}.svc.cluster.local
    可以进入到pod中查看/etc/hosts
    
    访问Service:
    {service-name}.{namespace}.svc.cluster.local


```

