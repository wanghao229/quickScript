

### 安装
https://www.cnblogs.com/xiao987334176/p/9930517.html
```
docker pull prom/node-exporter
docker pull prom/prometheus
docker pull grafana/grafana
```


### 安装node-exporter
https://grafana.com/oss/prometheus/exporters/node-exporter/?tab=installation
```
wget https://github.com/prometheus/node_exporter/releases/download/v1.1.1/node_exporter-1.1.1.linux-amd64.tar.gz
```

```

docker run -d -p 9100:9100 \
  -v "/proc:/host/proc:ro" \
  -v "/sys:/host/sys:ro" \
  -v "/:/rootfs:ro" \
  --net="host" \
  prom/node-exporter
  
```

### 安装Prometheus

```
docker run  -d \
  -p 9091:9090 \
  -v /opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml  \
  -v /opt/prometheus:/usr/local/prometheus  \
  prom/prometheus prometheus
```


```
https://grafana.com/oss/prometheus/exporters/node-exporter/assets/node_rules.yaml
https://grafana.com/oss/prometheus/exporters/node-exporter/assets/node_alerts.yaml

```

```
rule_files:
  - "node_rules.yaml"
  - "node_alerts.yaml"
  
```

### 安装Grafana
```
docker run -d \
  -p 3001:3000 \
  --name=grafana \
  -v /opt/grafana-storage:/var/lib/grafana \
  grafana/grafana
```
 

### 安装 JVM Exporter
* https://cloud.tencent.com/developer/article/1601717

### Eureka Discover
* https://sonicshield.cn/eureka-prometheus-code.html?ivk_sa=1024609v



### Jenkins Metrics
* https://cloud.tencent.com/developer/article/1622305
> Prometheus metrics

