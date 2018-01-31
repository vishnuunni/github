#!/bin/bash
epath=/var/log/elasticsearch/Brands.log
spath=/opt/c2s/scripts
brandslog=`du -k $epath | cut -f1`
if [ $brandslog -ge 100000 ]
then
	zip -r /var/log/elasticsearch/Brands.log$(date +%d%b%T).zip $epath && echo > $epath
else
	exit 0
fi

find /var/log/elasticsearch -name "Brands.log.*" | grep -v Brands.log.*.zip > $spath/grepname.txt
cat $spath/grepname.txt | cut -b 24- > $spath/cutname.txt
cat $spath/cutname.txt | zip -@ /var/log/elasticsearch/Brands_combo_zip$(date +%d%b%T).zip
cat $spath/cutname.txt | xargs rm -rf
rm -rf $spath/grepname.txt $spath/cutname.txt
