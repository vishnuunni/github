#!/bin/bash
echo  -n "  Please enter a file name to search : "
read file
echo ""
#find /home/vishnu -name *$file* 
find=`find /home/vishnu -name *$file* -not -path '*/\.*' 2>&1 | grep -v "Permission denied"`
if [ -z "$find" ]
then
echo "  No Match !"
echo ""
exit
else
echo "$find"
#true
#fi
echo ""
echo "  Above are the matching file."
echo "  Please enter the complete path        [warning]"
echo -n "  File path : "
read path
if [ -f $path ]
then
echo "  You have selected $path"
else
echo "  File not found !"
fi
fi
