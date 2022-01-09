
echo "yum install "

yum install telnet -y 
yum install java-1.8.0-openjdk* -y
yum install tree -y 
yum install jq -y
yum install -y nc
yum install -y netcat

echo "dns.h"
rm dns.sh
wget https://raw.githubusercontent.com/wanghao229/quickScript/master/dns.sh
sh dns.sh

echo "maven.sh"
rm maven.sh
wget https://raw.githubusercontent.com/wanghao229/quickScript/master/maven/maven.sh
sh maven.sh


echo "docker"

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/centos/docker-ce.repo
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

sudo yum install docker-ce docker-ce-cli containerd.io -y

mkdir -p /etc/docker
cat > /etc/docker/daemon.json << EOF
{ 
"registry-mirrors": ["https://docker.mirrors.ustc.edu.cn"] 
}
EOF

echo "ssh"

echo export TMOUT=1000000 >> /root/.bash_profile; source /root/.bash_profile


echo "~/.bashrc"
mkdir -p /home/wyatt

cat > ~/.bashrc << EOF
alias wy='cd /home/wyatt'
EOF

source ~/.bashrc


echo "dnsUpdate"
rm dnsUpdate.sh
wget https://raw.githubusercontent.com/wanghao229/quickScript/master/dnsUpdate.sh

sh dnsUpdate.sh




