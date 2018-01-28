#!/bin/bash
echo > /var/run/graylog.pid
ps aux | grep graylog | grep -v " grep graylog" | grep -v "sh graylog_pid_check.sh" | grep -v "graylog_pid_che*" | head -1 | awk '{print $2}' > /var/run/graylog.pid
PID=/var/run/graylog.pid
if [ -s $PID ]; then
	exit 0
else
	exit 1
fi
