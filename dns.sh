#/bin/bash

dest="/etc/hosts"
profile="/etc/profile"
extIp=$1

echo $dest


cp $dest{,.backup."$(date +%Y%m%d-%H%M%S)"}

echo "删除 $dest 旧配置文件"
sed -i "/^[^#].*eureka-server.*/d" $dest
sed -i "/^[^#].*dbhost.*/d" $dest
sed -i "/^[^#].*extIp.*/d" $dest
sed -i "/^[^#].*oauth2Host.*/d" $dest
sed -i "/^[^#].*github.global.ssl.Fastly.net.*/d" $dest
sed -i "/^[^#].*es.*/d" $dest

echo "删除 $profile 旧配置文件"
sed -i "/^[^#].*extIp.*/d" $profile

echo "配置dns"
cat >>$dest<<EOF
101.34.168.240 eureka-server1
101.34.168.240 eureka-server2
101.34.168.240 dbhost
101.34.248.75 oauth2Host
199.232.69.194 github.global.ssl.Fastly.net
150.158.52.34 es7Host
101.34.248.75 es6Host
EOF

echo "---------------------------"


if [ ! $extIp ]; then
  echo "请输入外网ip"
  read extIp
fi

echo "extIp:${extIp}"

echo "${extIp} extIp" >> $dest
echo "export extIp=${extIp}" >> $profile

echo "---------------------------"

cat $dest

