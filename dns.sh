#/bin/bash

dest="/etc/hosts"

echo $dest

cp $dest{,.backup."$(date +%Y%m%d-%H%M%S)"}

sed -i "/^[^#].*eureka-server.*/d" $dest
sed -i "/^[^#].*dbhost.*/d" $dest

echo "配置dns"
cat >>$dest<<EOF
101.34.168.240 eureka-server1
101.34.168.240 eureka-server2
1.116.17.54 dbhost
EOF

echo "---------------------------"
cat $dest
