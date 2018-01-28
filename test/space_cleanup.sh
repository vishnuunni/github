#!/bin/bash
#Log clear on path /var/log/httpd
access_size=`du -sh /var/log/httpd/access_log`
error_size=`du -sh /var/log/httpd/error_log`
min_size=100
if [ $access_size -gt $min_size ]
then
echo "greater"
#zip -r /var/log/httpd/access_log$(date +%d_%b).zip /var/log/httpd/access_log && echo > /var/log/httpd/access_log
#zip -r /var/log/httpd/error_log$(date +%d_%b).zip /var/log/httpd/error_log && echo > /var/log/httpd/error_log
else
echo "lesser than"
fi
