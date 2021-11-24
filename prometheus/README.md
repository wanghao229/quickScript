

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
### 安装Prometheus

```
docker run  -d \
  -p 9090:9090 \
  -v /opt/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml  \
  -v /opt/prometheus/node_rules.yaml:/etc/prometheus/node_rules.yaml  \
  -v /opt/prometheus/node_alerts.yaml:/etc/prometheus/node_alerts.yaml  \
  prom/prometheus
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
  -p 3000:3000 \
  --name=grafana \
  -v /opt/grafana-storage:/var/lib/grafana \
  grafana/grafana
```
 
