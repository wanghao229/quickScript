echo "apache banana orange" | awk '{print $1,$2,$3}' | while read a b c
do
	echo a=$a b=$b c=$c
done
echo "-------------"
read -p "Enter you password:" pwd
echo pwd=$pwd


read file pos <<<` echo $(mysql -h dbhost -uwyatt -p$pwd -e "SHOW MASTER STATUS" | grep mysql)  | awk  '{print $1,$2}'`

echo file=$file,pos=$pos

echo "-------------"
# mysql -uroot -proot -e "show slave status\G"

echo "---stop slave;"

mysql -uroot -proot -e "stop slave;"

echo "---CHANGE MASTER TO XXX"
mysql -uroot -proot <<EOF
CHANGE MASTER TO
MASTER_HOST='dbhost',
MASTER_USER='repl',
MASTER_PASSWORD='wang',
MASTER_LOG_FILE='${file}',
MASTER_LOG_POS=${pos};
EOF


echo "---start slave;"
sleep 1
mysql -uroot -proot -e "start slave;"
