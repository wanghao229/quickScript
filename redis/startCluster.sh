for port in `seq 6000 6005`; do
  docker run -d -ti -p ${port}:${port} -p 1${port}:1${port} -v /usr/local/docker/redis/${port}/conf/redis.conf:/usr/local/etc/redis/redis.conf -v /usr/local/docker/redis/${port}/data:/data  --restart always --name redis-${port} --net redis-net --sysctl net.core.somaxconn=1024 redis redis-server /usr/local/etc/redis/redis.conf;
done