
### dnsmasq
https://cloud.tencent.com/developer/article/1692705

```
docker pull jpillora/dnsmasq

mkdir -p /data/dns/
vi /data/dns/dnsmasq.conf

#dns解析日志
log-queries
#域名与IP映射
address=/dbhost/101.34.168.240

docker run -d\
    --name dnsmasq \
    --restart always \
    -p 53:53/udp \
    -p 8080:8080 \
    -v /data/dns/dnsmasq.conf:/etc/dnsmasq.conf \
    -v /etc/localtime:/etc/localtime \
    --log-opt "max-size=100m" \
    -e "HTTP_USER=admin" \
    -e "HTTP_PASS=wang" \
    jpillora/dnsmasq
    
```
> nslookup dbhost 150.158.52.34
