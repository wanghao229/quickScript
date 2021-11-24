#/bin/bash

dest="/etc/hosts"
extIp=$1

echo $dest


cp $dest{,.backup."$(date +%Y%m%d-%H%M%S)"}

sed -i "/^[^#].*eureka-server.*/d" $dest
sed -i "/^[^#].*dbhost.*/d" $dest
sed -i "/^[^#].*extIp.*/d" $dest
sed -i "/^[^#].*oauth2Host.*/d" $dest

echo "配置dns"
cat >>$dest<<EOF
101.34.168.240 eureka-server1
101.34.168.240 eureka-server2
101.34.168.240 dbhost
101.34.248.75 oauth2Host
EOF

echo "---------------------------"


if [ ! $extIp ]; then
  echo "请输入外网ip"
  read extIp
fi

echo "extIp:${extIp}"

echo "${extIp} extIp" >> $dest

echo "---------------------------"

cat $dest

