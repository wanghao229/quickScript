#!/bin/bash
RUN_PATH=$(cd $(dirname $0); pwd)

# 备份目录
echo $RUN_PATH
BACKUP_ROOT=$RUN_PATH
BACKUP_FILEDIR=$BACKUP_ROOT/data

DATE=$(date +%Y%m%d)
#DATE=$(date +%Y%m%d%H%M%S)

echo $BACKUP_FILEDIR/$DATE

mkdir -p $BACKUP_FILEDIR/$DATE

read -p "Enter you password:" pwd
echo pwd=$pwd

DATABASES=$(mysql  -h dbhost -uwyatt -p"${pwd}" -e "show databases" | grep -Ev "Database|sys|information_schema|performance_schema|mysql")

for db in $DATABASES
do

echo "db:$db"
if [ "${db}" = "discuzQ_two" ] || [ "${db}" = "wish" ];then
echo "jump over ${db}"
else
begin=$(date +%s)

echo ----------${db}.sql BEGIN----------
mysqldump  -h dbhost -uwyatt -p'${pwd}' --default-character-set=utf8 -q --lock-all-tables --flush-logs -E -R --triggers -B ${db} > $BACKUP_FILEDIR/$DATE/${db}.sql
end=$(date +%s)
echo ${db}

echo time:$((end-begin))
echo ----------COMPLETE----------
fi
done

echo "done"




