#!/bin/bash
RUN_PATH=$(cd $(dirname $0); pwd)

# 备份目录
echo $RUN_PATH
BACKUP_ROOT=$RUN_PATH
BACKUP_FILEDIR=$BACKUP_ROOT/data

DATE=$(date +%Y%m%d)

# echo $BACKUP_FILEDIR/$DATE

ls -l $BACKUP_FILEDIR
echo Date:$DATE

read -p "请选择回复的目录:" DATE
echo "选择的目录：$DATE"

data=$(ls -l $BACKUP_FILEDIR/$DATE | awk '{print $9}' | awk -F. '{print $1}'|  grep -v '^$')

echo $data

for var in $data
do
echo $var
#mysql -uroot -proot -e "show databases;"
mysql -uroot -proot -e "drop database if exists $var;"
mysql -uroot -proot -e "create database $var;"
mysql -uroot -proot $var < $BACKUP_FILEDIR/$DATE/$var.sql

done
