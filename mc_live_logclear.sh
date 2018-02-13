#!/bin/bash
apath=/var/log/httpd/access_log
epath=/var/log/httpd/error_log
asize=`du -k $apath | cut -f1`
esize=`du -k $epath | cut -f1`

if [ $asize -ge 100000 ]
then
	#zip -r /var/log/httpd/access_log$(date +%d%b%T).zip $apath && echo > $apath
	echo "Greater"
else
	#exit 0
	echo "Smaller"
fi

if [ $size -ge 50000 ]
then
	#zip -r /var/log/httpd/error_log$(date +%d%b%T).zip $epath && echo > $epath
	echo "Greater"
else
	#exit 0
	echo "Smaller"
fi
