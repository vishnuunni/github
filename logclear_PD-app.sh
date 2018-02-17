#!/bin/bash
appath=/var/log/app
rpmapp=/var/log/rpmapp
appsize=`du -k  $appath/uwsgi.log | cut -f1`
rpmappsize=`du -k $rpmapp/uwsgi.log | cut -f1`
if [ $appsize -ge 100000 ]
then
	zip -r uwsgi.log$(date +%d%b).zip uwsgi.log && echo > uwsgi.log
else
	exit
fi

if [ $rpmappsize -ge 100000 ]
then
	zip -r uwsgi.log$(date +%d%b).zip uwsgi.log && echo > uwsgi.log
else
	exit
fi
