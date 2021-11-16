echo "开始自动加入集群"

dockerId=$(docker ps -a | grep redis | awk '{print $1}'|head -1)

echo $dockerId

docker exec -i $dockerId bash <<EOF

pwd
whoami
last root

echo "查看redis 集群信息"

redis-cli -h 1.116.17.54 -p 6000

cluster nodes


cluster info

echo "执行redis命令"

set 234 234
get 234

EOF

echo "退出Docker容器($dockerId)"

