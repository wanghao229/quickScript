#/bin/bash

hostname=$(hostname)
echo "hostname:${hostname}"

echo "hostname:"${hostname//VM/123}

echo  ${hostname//-/\\\-}

echo "请输入外网ip地址"
read ip
echo "ip:${ip}"

echo "------------------------------"

dest="/etc/hosts"

cp /etc/hosts{,.backup."$(date +%Y%m%d-%H%M%S)"}


echo $dest
echo "s/^[^#].*$hostname.*/#&/"

sed -i "s/^[^#].*$hostname.*/#&/" $dest
sed -i "s/^#\($ip.*\)/\1/" $dest

#grep -c "$ip" "$dest"

if [ `grep -c "$ip" "$dest"` -eq '0' ];then
  echo "配置Dubbo外网地址:$dest"
  echo "$ip $hostname" >> $dest
else
  echo "已配置"
fi


echo "------------------------------"

cat $dest


