### 下载


file="apache-maven-3.8.3-bin.tar.gz"
folder="apache-maven-3.8.3"
destDir="/usr/local/apache-maven-3.8.3"


if [ ! -f "$file" ]; then
  echo "开始下载apache-maven-3.8.3-bin.tar.gz"
  wget https://dlcdn.apache.org/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz --no-check-certificate
else
  echo "文件apache-maven-3.8.3-bin.tar.gz已下载"
fi

if [ ! -d "$folder" ]; then
  echo "解压apache-maven-3.8.3-bin.tar.gz"
  tar -xvzf apache-maven-3.8.3-bin.tar.gz
else
  echo "文件已解压"
fi

if [ ! -d "/usr/local/apache-maven-3.8.3" ]; then
  echo "创建目录"
  mkdir /usr/local/apache-maven-3.8.3
else
  echo "/usr/local/apache-maven-3.8.3目录已存在"
fi

echo "移动文件"
cp -r  apache-maven-3.8.3/*  /usr/local/apache-maven-3.8.3/

if [ `grep -c "MAVEN_HOME" "/etc/profile"` -ne '0' ]; then
  echo "/etc/profile已配置环境变量"
else
  echo "配置环境变量"
  echo "MAVEN_HOME=/usr/local/apache-maven-3.8.3" >> /etc/profile
  echo "export MAVEN_HOME" >> /etc/profile
fi

source /etc/profile


cp $destDir/conf/settings.{xml,backup."$(date +%Y%m%d-%H%M%S)"}


rm -rf settings.xml

wget https://raw.githubusercontent.com/wanghao229/quickScript/master/maven/settings.xml

mv -f settings.xml $destDir/conf/settings.xml


