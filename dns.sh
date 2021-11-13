#/bin/bash

dest="/etc/hosts"
extIp=$1

echo $dest


cp $dest{,.backup."$(date +%Y%m%d-%H%M%S)"}

sed -i "/^[^#].*eureka-server.*/d" $dest
sed -i "/^[^#].*dbhost.*/d" $dest
sed -i "/^[^#].*extIp.*/d" $dest

echo "配置dns"
cat >>$dest<<EOF
101.34.168.240 eureka-server1
101.34.168.240 eureka-server2
1.116.17.54 dbhost
EOF

echo "---------------------------"


if [ ! $extIp ]; then
  echo "请输入外网ip"
  read extIp
fi

echo "extIp:${extIp}"

echo "${extIp} extIp" >> $dest
