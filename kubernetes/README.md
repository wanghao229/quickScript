
# k8s安装
#### 安装
* https://kubernetes.io/zh/docs/setup/production-environment/tools/_print/#pg-29e59491dd6118b23072dfe9ebb93323
* https://segmentfault.com/a/1190000038360804 ,good
* https://segmentfault.com/a/1190000040107263 ,good

```
cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=http://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
        http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF
```


```
#修改 /etc/sysctl.conf
# 如果有配置，则修改
sed -i "s#^net.ipv4.ip_forward.*#net.ipv4.ip_forward=1#g"  /etc/sysctl.conf
sed -i "s#^net.bridge.bridge-nf-call-ip6tables.*#net.bridge.bridge-nf-call-ip6tables=1#g"  /etc/sysctl.conf
sed -i "s#^net.bridge.bridge-nf-call-iptables.*#net.bridge.bridge-nf-call-iptables=1#g"  /etc/sysctl.conf
sed -i "s#^net.ipv6.conf.all.disable_ipv6.*#net.ipv6.conf.all.disable_ipv6=1#g"  /etc/sysctl.conf
sed -i "s#^net.ipv6.conf.default.disable_ipv6.*#net.ipv6.conf.default.disable_ipv6=1#g"  /etc/sysctl.conf
sed -i "s#^net.ipv6.conf.lo.disable_ipv6.*#net.ipv6.conf.lo.disable_ipv6=1#g"  /etc/sysctl.conf
sed -i "s#^net.ipv6.conf.all.forwarding.*#net.ipv6.conf.all.forwarding=1#g"  /etc/sysctl.conf
# 可能没有，追加
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
echo "net.bridge.bridge-nf-call-ip6tables = 1" >> /etc/sysctl.conf
echo "net.bridge.bridge-nf-call-iptables = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.all.forwarding = 1"  >> /etc/sysctl.conf
# 执行命令以应用
sysctl -p

```


```
# 将 SELinux 设置为 permissive 模式（相当于将其禁用）
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
sudo yum install -y kubelet-1.23.4-0.x86_64 kubeadm-1.23.4-0.x86_64 kubectl-1.23.4-0.x86_64 --disableexcludes=kubernetes

sudo systemctl enable --now kubelet


sed -i "s#^ExecStart=/usr/bin/dockerd.*#ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock --exec-opt native.cgroupdriver=systemd#g" /usr/lib/systemd/system/docker.service

systemctl daemon-reload
systemctl restart docker
systemctl enable kubelet && systemctl start kubelet

```


```

kubeadm token create --print-join-command

sudo kubeadm init \
    --apiserver-advertise-address=外网IP \
    --control-plane-endpoint=外网IP  \
    --image-repository registry.cn-hangzhou.aliyuncs.com/google_containers

```

#### kubectl
```
rm -rf /root/.kube/
mkdir /root/.kube/

mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

```

#### Worker 节点
```
scp root@XXX:$HOME/.kube/config $HOME/.kube/

sudo kubeadm join XXX --node-name XXX

```

#### 镜像问题

* https://blog.csdn.net/qq_31024251/article/details/115752033
* k8s,gcr.io 无法访问
* kubeletNotReady runtime network not ready

 
```
kubeadm config images pull --image-repository=registry.aliyuncs.com/google_containers

docker tag registry.aliyuncs.com/google_containers/kube-apiserver:v1.23.2 k8s.gcr.io/kube-apiserver:v1.23.2
docker tag registry.aliyuncs.com/google_containers/kube-controller-manager:v1.23.2 k8s.gcr.io/kube-controller-manager:v1.23.2
docker tag registry.aliyuncs.com/google_containers/kube-scheduler:v1.23.2 k8s.gcr.io/kube-scheduler:v1.23.2
docker tag registry.aliyuncs.com/google_containers/kube-proxy:v1.23.2 k8s.gcr.io/kube-proxy:v1.23.2
docker tag registry.aliyuncs.com/google_containers/etcd:3.5.1-0  k8s.gcr.io/etcd:3.5.1-0
docker tag registry.aliyuncs.com/google_containers/coredns:v1.8.6  k8s.gcr.io/coredns/coredns:v1.8.6
docker tag registry.aliyuncs.com/google_containers/pause:3.6  k8s.gcr.io/pause:3.6

docker tag registry.aliyuncs.com/google_containers/kube-apiserver:v1.23.4 k8s.gcr.io/kube-apiserver:v1.23.4
docker tag registry.aliyuncs.com/google_containers/kube-controller-manager:v1.23.4 k8s.gcr.io/kube-controller-manager:v1.23.4
docker tag registry.aliyuncs.com/google_containers/kube-scheduler:v1.23.4 k8s.gcr.io/kube-scheduler:v1.23.4
docker tag registry.aliyuncs.com/google_containers/kube-proxy:v1.23.4 k8s.gcr.io/kube-proxy:v1.23.4
docker tag registry.aliyuncs.com/google_containers/etcd:3.5.1-0  k8s.gcr.io/etcd:3.5.1-0
docker tag registry.aliyuncs.com/google_containers/coredns:v1.8.6  k8s.gcr.io/coredns/coredns:v1.8.6
docker tag registry.aliyuncs.com/google_containers/pause:3.6  k8s.gcr.io/pause:3.6

```

#### Master调整Taint/Toleration策略
```
kubectl describe node kubernetesnode01

kubectl taint nodes --all node-role.kubernetes.io/master-

```

#### 更换外网IP地址
* https://www.caiyifan.cn/p/d6990d10.html 
* https://blog.csdn.net/xuxile/article/details/77562779 虚拟IP配置
```

vi /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf
--node-ip=公网IP



vi /etc/sysconfig/network-scripts/ifcfg-eth0:1

DEVICE=eth0:1
ONBOOT=yes
BOOTPROTO=static
IPADDR=XXX.XXX.XXX.XXX
NETMASK=255.0.0.0
GATEWAY=0.0.0.0

DEVICE=eth0:1
ONBOOT=yes
BOOTPROTO=static
IPADDR=XXX.XXX.XXX.XXX
NETMASK=255.255.255.0
GATEWAY=0.0.0.0

service network restart
```

## 安装Pod Network 插件
#### weave
* https://www.weave.works/docs/net/latest/kubernetes/kube-addon/
```
sudo  docker pull weaveworks/weave-npc:2.8.1
sudo  docker pull weaveworks/weave-kube:2.8.1

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"


# 重启 docker，并启动 kubelet
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo  systemctl enable kubelet &&  sudo  systemctl start kubelet

```


## Dashboard
#### 安装
* https://github.com/kubernetes/dashboard/releases
> kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
 
* https://www.cnblogs.com/liyuanhong/p/13799404.html
> kubectl proxy --port=8001 --address='0.0.0.0' --accept-hosts='^.*' &

#### RBAC
* https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md


#### NortPort
* https://cloud.tencent.com/developer/article/1579807

```
Creating a Service Account

apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
```

```
Creating a ClusterRoleBinding

apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard

```

```
kubectl edit services kubernetes-dashboard -n kubernetes-dashboard

kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"

```

#### Addons
* https://kubernetes.io/zh/docs/concepts/cluster-administration/addons/
> 


## Metrics-server
* https://github.com/kubernetes-sigs/metrics-server
* https://cloud.tencent.com/developer/article/1818865
* 
* 0.6.0
> kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.6.0/components.yaml
> 
> kubectl get apiservice v1beta1.metrics.k8s.io -o yaml

```
command:
- /metrics-server
- --kubelet-insecure-tls
- --kubelet-preferred-address-types=InternalIP
```

* no route to host
* https://stackoverflow.com/questions/60101398/kubernetes-without-pod-metrics
```
spec:
  hostNetwork: true
  containers:
  - args:
    - --kubelet-insecure-tls
    - --cert-dir=/tmp
    - --secure-port=4443
    - --kubelet-preferred-address-types=InternalIP
    - --v=6
    image: k8s.gcr.io/metrics-server-amd64:v0.3.6
    imagePullPolicy: Always
```
* https://stackoverflow.com/questions/62138734/metric-server-not-working-unable-to-handle-the-request-get-nodes-metrics-k8s
* https://www.linuxsysadmins.com/service-unavailable-kubernetes-metrics/ 全面

```
kubectl edit deployments.apps -n kube-system metrics-server
dnsPolicy: ClusterFirst
hostNetwork: True

```

#### 启用Aggregator Routing
* https://www.cnblogs.com/lfl17718347843/p/14283796.html
```
cat /etc/kubernetes/manifests/kube-apiserver.yaml

--enable-aggregator-routing=true 
```

## k8s迁移
* 以后再说

## 使用

#### busybox
* https://kubernetes.io/docs/reference/kubectl/cheatsheet/
```
kubectl run -i --tty busybox --image=busybox -- sh  # Run pod as interactive shell
kubectl run nginx --image=nginx -n mynamespace      # Start a single instance of nginx pod in the namespace of mynamespace
kubectl run nginx --image=nginx                     # Run pod nginx and write its spec into a file called pod.yaml

```

#### 默认空间
* https://kubernetes.io/docs/reference/kubectl/cheatsheet/ 
* http://docs.kubernetes.org.cn/537.html
```
# permanently save the namespace for all subsequent kubectl commands in that context.
kubectl config set-context --current --namespace=ggckad-s2

kubectl create namespace my-namespace
```

#### Volumes
https://kubernetes.io/docs/concepts/storage/persistent-volumes/
 
 
#### k8s配置
```

hostnamectl set-hostname kube-master0

```

