
## k8s
### 安装
* https://kubernetes.io/zh/docs/setup/production-environment/tools/_print/#pg-29e59491dd6118b23072dfe9ebb93323
* https://segmentfault.com/a/1190000038360804

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

# 将 SELinux 设置为 permissive 模式（相当于将其禁用）
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes

sudo systemctl enable --now kubelet
```
### IMAGE
* https://segmentfault.com/a/1190000040107263
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
```

### 安装Pod Network 插件
#### weave
* https://www.weave.works/docs/net/latest/kubernetes/kube-addon/
```
docker pull weaveworks/weave-npc:2.8.1
docker pull weaveworks/weave-kube:2.8.1

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"


# 重启 docker，并启动 kubelet
systemctl daemon-reload
systemctl restart docker
systemctl enable kubelet && systemctl start kubelet


```

### Addons
* https://kubernetes.io/zh/docs/concepts/cluster-administration/addons/

---

## 使用
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
 

