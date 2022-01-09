

### 安装
* https://cloud.tencent.com/developer/article/1654844


http://nginx.org/download/nginx-1.21.4.tar.gz


```
server{
  listen 80;
  server_name 127.0.0.1; # 公网ip
  index  index.php index.html index.htm;

  location / {
    proxy_pass  http://127.0.0.1:8080; # 或 http://www.baidu.com
    proxy_set_header Host $proxy_host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}
```

### 运行
* /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
* 
