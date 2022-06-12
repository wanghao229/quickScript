

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

  * 导入JSON：https://clickhouse.com/docs/en/faq/integration/json-import/ 

  ```
  cat 5m_Sales_Records.csv | clickhouse  client -d default  --format_csv_delimiter="," \
  --date_time_input_format=best_effort\
  -q 'INSERT into sales FORMAT CSVWithNames'
  
  
  SELECT formatReadableSize(total_bytes) FROM system.tables WHERE name = 'uk_price_paid';
  
  ```

  * JSON方式查询

    ```
    wget https://data.gharchive.org/2022-06-01-10.json.gz
    
    SELECT count(*)
    FROM file('/Users/a11080178/Documents/github-1/2022-06-01-10.json', LineAsString, 'data String')
    
    ```

  * 1

    ```
    
    cat part01.json | jq -c '
    [
        .type,
        .actor.login? // .actor_attributes.login? // (.actor | strings) // null,
        .repo.name? // (.repository.owner? + "/" + .repository.name?) // null,
        .created_at,
        .payload.updated_at? // .payload.comment?.updated_at? // .payload.issue?.updated_at? // .payload.pull_request?.updated_at? // null,
        .payload.action,
        .payload.comment.id,
        .payload.review.body // .payload.comment.body // .payload.issue.body? // .payload.pull_request.body? // .payload.release.body? // null,
        .payload.comment?.path? // null,
        .payload.comment?.position? // null,
        .payload.comment?.line? // null,
        .payload.ref? // null,
        .payload.ref_type? // null,
        .payload.comment.user?.login? // .payload.issue.user?.login? // .payload.pull_request.user?.login? // null,
        .payload.issue.number? // .payload.pull_request.number? // .payload.number? // null,
        .payload.issue.title? // .payload.pull_request.title? // null,
        [.payload.issue.labels?[]?.name // .payload.pull_request.labels?[]?.name],
        .payload.issue.state? // .payload.pull_request.state? // null,
        .payload.issue.locked? // .payload.pull_request.locked? // null,
        .payload.issue.assignee?.login? // .payload.pull_request.assignee?.login? // null,
        [.payload.issue.assignees?[]?.login? // .payload.pull_request.assignees?[]?.login?],
        .payload.issue.comments? // .payload.pull_request.comments? // null,
        .payload.review.author_association // .payload.issue.author_association? // .payload.pull_request.author_association? // null,
        .payload.issue.closed_at? // .payload.pull_request.closed_at? // null,
        .payload.pull_request.merged_at? // null,
        .payload.pull_request.merge_commit_sha? // null,
        [.payload.pull_request.requested_reviewers?[]?.login],
        [.payload.pull_request.requested_teams?[]?.name],
        .payload.pull_request.head?.ref? // null,
        .payload.pull_request.head?.sha? // null,
        .payload.pull_request.base?.ref? // null,
        .payload.pull_request.base?.sha? // null,
        .payload.pull_request.merged? // null,
        .payload.pull_request.mergeable? // null,
        .payload.pull_request.rebaseable? // null,
        .payload.pull_request.mergeable_state? // null,
        .payload.pull_request.merged_by?.login? // null,
        .payload.pull_request.review_comments? // null,
        .payload.pull_request.maintainer_can_modify? // null,
        .payload.pull_request.commits? // null,
        .payload.pull_request.additions? // null,
        .payload.pull_request.deletions? // null,
        .payload.pull_request.changed_files? // null,
        .payload.comment.diff_hunk? // null,
        .payload.comment.original_position? // null,
        .payload.comment.commit_id? // null,
        .payload.comment.original_commit_id? // null,
        .payload.size? // null,
        .payload.distinct_size? // null,
        .payload.member.login? // .payload.member? // null,
        .payload.release?.tag_name? // null,
        .payload.release?.name? // null,
        .payload.review?.state? // null
    ]'
    ```

  * https://ghe.clickhouse.tech/

  * MkDocs: https://markdown-docs-zh.readthedocs.io/zh_CN/latest/

  

* MySQL

  * https://stackoverflow.com/questions/59993844/error-loading-local-data-is-disabled-this-must-be-enabled-on-both-the-client
  * https://dba.stackexchange.com/questions/55960/mysql-import-csv-file-error-13-hy000-cant-get-stat-of-path-file-csv-errcod
  * CSV导入MySQL：https://www.yiibai.com/mysql/import-csv-file-mysql-table.html

  ```
  SET GLOBAL local_infile=1;
  SHOW GLOBAL VARIABLES LIKE 'local_infile';
  
  mysql -uroot -p --local-infile
  
  load data local infile '/Users/a11080178/Downloads/5m_Sales_Records.csv' into table sales fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;
  
  load data local infile '/Users/a11080178/Downloads/pp-complete.csv' into table uk_price_paid fields terminated by ',' enclosed by '"' lines terminated by '\n' (uuid,price,date,postcode1,type,is_new,duration,addr1,addr2,street,locality,town,district,county,category);
  
  
  ```

  * 表

    ```
     
     update uk_price_paid set postcode2 = postcode1;
     
    ```