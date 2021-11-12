#/bin/bash

dest="/etc/hosts"

echo $dest

cp $dest{,.backup."$(date +%Y%m%d-%H%M%S)"}

sed -i "/^[^#].*eureka-server.*/d" $dest

echo "配置dns"
cat >>$dest<<EOF
101.34.168.240 eureka-server1
101.34.168.240 eureka-server2
EOF

echo "---------------------------"
cat $dest
