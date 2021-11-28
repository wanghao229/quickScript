
jvmJson="/opt/prometheus/targets-jvm.json"

echo "更新$jvmJson"
curl -s -H 'Accept:application/json' http://eureka-server1:8761/eureka/apps | jq '[.applications.application[] | select(.name != "GATEWAY") | { labels:{job:.name,instance:.instance[] | .instanceId},targets:[ .instance[] | .ipAddr + ":" + (.port["$"] + 10000 | tostring) ] }]' > $jvmJson


echo "------------------------------------"

cat $jvmJson



