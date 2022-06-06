## 安装

#### 物理机安装

* https://clickhouse.com/docs/zh/getting-started/install/

```

LATEST_VERSION=$(curl -s https://packages.clickhouse.com/tgz/stable/ | \
    grep -Eo '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort -V -r | head -n 1)
export LATEST_VERSION
curl -O "https://packages.clickhouse.com/tgz/stable/clickhouse-common-static-$LATEST_VERSION-amd64.tgz"
curl -O "https://packages.clickhouse.com/tgz/stable/clickhouse-common-static-dbg-$LATEST_VERSION-amd64.tgz"
curl -O "https://packages.clickhouse.com/tgz/stable/clickhouse-server-$LATEST_VERSION-amd64.tgz"
curl -O "https://packages.clickhouse.com/tgz/stable/clickhouse-client-$LATEST_VERSION-amd64.tgz"

tar -xzvf "clickhouse-common-static-$LATEST_VERSION-amd64.tgz"
sudo "clickhouse-common-static-$LATEST_VERSION/install/doinst.sh"

tar -xzvf "clickhouse-common-static-dbg-$LATEST_VERSION-amd64.tgz"
sudo "clickhouse-common-static-dbg-$LATEST_VERSION/install/doinst.sh"

tar -xzvf "clickhouse-server-$LATEST_VERSION-amd64.tgz"
sudo "clickhouse-server-$LATEST_VERSION/install/doinst.sh"
sudo /etc/init.d/clickhouse-server start

tar -xzvf "clickhouse-client-$LATEST_VERSION-amd64.tgz"
sudo "clickhouse-client-$LATEST_VERSION/install/doinst.sh"


```



#### 源码编译安装

* https://zhuanlan.zhihu.com/p/391898480
* 

#### Docker

* Docker 安装包并不是一个很好的学习选择。