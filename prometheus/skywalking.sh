
file="apache-skywalking-java-agent-8.8.0.tgz"
folder="skywalking-agent"
destDir="/usr/local/${folder}"

echo "开始配置$file"


if [ ! -f "$file" ]; then
  echo "开始下载$file"
  wget https://dlcdn.apache.org/skywalking/java-agent/8.8.0/apache-skywalking-java-agent-8.8.0.tgz --no-check-certificate
else
  echo "文件$file已下载"
fi

if [ ! -d "$folder" ]; then
  echo "解压$file"
  tar -xvzf $file
else
  echo "文件已解压"
fi


if [ ! -d $destDir ]; then
  echo "创建目录 $destDir"
  mkdir $destDir
else
  echo "$destDir目录已存在"
fi


echo "移动文件 $folder to $destDir"
if [ ! -f "$destDir" ]; then
  cp -r  "$folder/."  "$destDir/"
else
  echo "$destDir已存在"
fi
