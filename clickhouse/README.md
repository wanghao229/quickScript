## 安装

#### 物理机安装

* https://clickhouse.com/docs/zh/getting-started/install/

```

LATEST_VERSION=$(curl -s https://packages.clickhouse.com/tgz/stable/ | \
    grep -Eo '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort -V -r | head -n 1)
export LATEST_VERSION
curl -O "https://packages.clickhouse.com/tgz/stable/clickhouse-common-static-$LATEST_VERSION-amd64.tgz"
curl -O "https://packages.clickhouse.com/tgz/stable/clickhouse-common-static-dbg-$LATEST_VERSION-amd64.tgz"
curl -O "https://packages.clickhouse.com/tgz/stable/clickhouse-server-$LATEST_VERSION-amd64.tgz"
curl -O "https://packages.clickhouse.com/tgz/stable/clickhouse-client-$LATEST_VERSION-amd64.tgz"

tar -xzvf "clickhouse-common-static-$LATEST_VERSION-amd64.tgz"
sudo "clickhouse-common-static-$LATEST_VERSION/install/doinst.sh"

tar -xzvf "clickhouse-common-static-dbg-$LATEST_VERSION-amd64.tgz"
sudo "clickhouse-common-static-dbg-$LATEST_VERSION/install/doinst.sh"

tar -xzvf "clickhouse-server-$LATEST_VERSION-amd64.tgz"
sudo "clickhouse-server-$LATEST_VERSION/install/doinst.sh"
sudo /etc/init.d/clickhouse-server start

tar -xzvf "clickhouse-client-$LATEST_VERSION-amd64.tgz"
sudo "clickhouse-client-$LATEST_VERSION/install/doinst.sh"


```

#### 已编译安装

* https://www.modb.pro/db/49076 80%

#### 源码编译安装

* https://zhuanlan.zhihu.com/p/391898480
* 

#### Docker

* Docker 安装包并不是一个很好的学习选择。



#### 测试集

* https://eforexcel.com/wp/wp-content/uploads/2020/09/5m-Sales-Records.7z

* CK

  ```
  cat 5m_Sales_Records.csv | clickhouse  client -d default  --format_csv_delimiter="," \
  --date_time_input_format=best_effort\
  -q 'INSERT into sales FORMAT CSVWithNames'
  
  
  SELECT formatReadableSize(total_bytes) FROM system.tables WHERE name = 'uk_price_paid';
  
  ```

* MySQL

  * https://stackoverflow.com/questions/59993844/error-loading-local-data-is-disabled-this-must-be-enabled-on-both-the-client
  * https://dba.stackexchange.com/questions/55960/mysql-import-csv-file-error-13-hy000-cant-get-stat-of-path-file-csv-errcod
  * CSV导入MySQL：https://www.yiibai.com/mysql/import-csv-file-mysql-table.html

  ```
  SET GLOBAL local_infile=1;
  SHOW GLOBAL VARIABLES LIKE 'local_infile';
  
  mysql -uroot -p --local-infile
  
  load data local infile '/Users/a11080178/Downloads/5m_Sales_Records.csv' into table sales fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;
  
  load data local infile '/Users/a11080178/Downloads/pp-complete.csv' into table uk_price_paid fields terminated by ',' enclosed by '"' lines terminated by '\n' (price,date,postcode1,type,is_new,duration,addr1,addr2,street,locality,town,district,county,category);
  
  ```

  * 表

    ```
     
     
     update uk_price_paid set postcode2 = postcode1;
    ```

    