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

cat>$destDir/conf/settings.xml<<EOF
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <localRepository/>
  <interactiveMode/>
  <usePluginRegistry/>
  <offline/>
  <pluginGroups/>
  <servers/>
  <mirrors>
    <mirror>
    <id>nexus-aliyun</id>
    <mirrorOf>central</mirrorOf>
    <name>Nexus aliyun</name>
    <url>http://maven.aliyun.com/nexus/content/groups/public</url>
    </mirror>

    <mirror>
      <id>repo1</id>
      <mirrorOf>central</mirrorOf>
      <name>central repo</name>
      <url>http://repo1.maven.org/maven2/</url>
    </mirror>
    <mirror>
     <id>aliyunmaven</id>
     <mirrorOf>apache snapshots</mirrorOf>
     <name>阿里云阿帕奇仓库</name>
     <url>https://maven.aliyun.com/repository/apache-snapshots</url>
    </mirror>
  </mirrors>
  <proxies/>
  <activeProfiles/>
  <profiles>
    <profile>
        <repositories>
          <repository>
            <id>alimaven</id>
            <name>aliyun maven</name>
            <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
            <releases>
                <enabled>true</enabled>
            </releases>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
          </repository>
            <repository>
                <id>MavenCentral</id>
                <url>http://repo1.maven.org/maven2/</url>
            </repository>
            <repository>
                <id>aliyunmavenApache</id>
                <url>https://maven.aliyun.com/repository/apache-snapshots</url>
            </repository>
        </repositories>
     </profile>
  </profiles>
EOF
