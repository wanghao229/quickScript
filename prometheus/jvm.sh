
file="jmx_prometheus_javaagent-0.16.1.jar"
destDir="/usr/local/jmx-agent"
configYaml="$destDir/simple-config.yml"

echo "开始配置$file"


if [ ! -f "$file" ]; then
  echo "开始下载$file"
  wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar --no-check-certificate
else
  echo "文件$file已下载"
fi


if [ ! -d $destDir ]; then
  echo "创建目录"
  mkdir $destDir
else
  echo "$destDir目录已存在"
fi


echo "移动文件"
if [ ! -f "$destDir/$file" ]; then
  cp -r  $file  "$destDir/"
else
  echo "$destDir/$file已存在"
fi

echo "备份$configYaml"
cp $configYaml{,.backup."$(date +%Y%m%d-%H%M%S)"}

cat >$configYaml<<EOF
---
lowercaseOutputLabelNames: true
lowercaseOutputName: true
whitelistObjectNames: ["java.lang:type=OperatingSystem"]
rules:
 - pattern: 'java.lang<type=OperatingSystem><>((?!process_cpu_time)\w+):'
   name: os_$1
   type: GAUGE
   attrNameSnakeCase: true
EOF

