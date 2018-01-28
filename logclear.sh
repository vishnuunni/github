#!/bin/bash
echo clearing syslog...
zip -r /var/log/syslog$(date +-%d%b-%T).zip /var/log/syslog && echo > /var/log/syslog
find /var/log/ -mtime +7 -type f -name "syslog*.zip" -exec rm -f {} \;
echo clearing dev.log...
zip -r /var/log/elasticsearch/dev.log$(date +-%d%b-%T).zip /var/log/elasticsearch/dev.log && echo > /var/log/elasticsearch/dev.log
find /var/log/elasticsearch/ -mtime +7 -type f -name "dev.log*.zip" -exec rm -f {} \;
echo Logs cleared
echo --------------------------------------------------
df -h
