### 下载


file="apache-maven-3.8.3-bin.tar.gz"
folder="apache-maven-3.8.3"
destDir="/usr/local/apache-maven-3.8.3"


if [ ! -f "$file" ]; then
  echo "开始下载apache-maven-3.8.3-bin.tar.gz"
  wget https://archive.apache.org/dist/maven/maven-3/3.8.3/binaries/apache-maven-3.8.3-bin.tar.gz --no-check-certificate
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
  echo "export PATH=\$PATH:\$MAVEN_HOME/bin"  >> /etc/profile
fi

source /etc/profile


cp $destDir/conf/settings.{xml,backup."$(date +%Y%m%d-%H%M%S)"}



settings="settings.xml"

if [ ! -f "$settings" ]; then
  echo "开始下载$settings"
  wget https://raw.githubusercontent.com/wanghao229/quickScript/master/maven/settings.xml
else
  echo "$settings已下载"
fi

 
cp -f settings.xml $destDir/conf/settings.xml




