echo "start elasticsearch"
call ../elasticsearch/bin/elasticsearch.bat
echo "start kibana"
call ../kibana/bin/kibana.bat
echo "../logstash/bin/logstash.bat"
call logstash.bat -f "C:/Users/neal1/project/bill-analysis/logstash.conf"