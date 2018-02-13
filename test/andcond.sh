#!/bin/bash
#echo "Checking for configuration file..."
#echo "Please holdon"
#file1=/home/vishnu/Desktop/Script_Hub/test/file1
#file2=/home/vishnu/Desktop/Script_Hub/test/file2
#file3=/home/vishnu/Desktop/Script_Hub/test/file3
#if [[ (-f "$file1" && -f "$file2" && -f "$file3") ]];
#then
#echo "Configurations found..." 
#else
#	
#echo "Not Found !"
#fi

echo "Checking for configuration file..."
echo "Please holdon"
file1=/home/vishnu/Desktop/Script_Hub/test/file1
file2=/home/vishnu/Desktop/Script_Hub/test/file2
file3=/home/vishnu/Desktop/Script_Hub/test/file3
if [ -f "$file1" ]
then
#echo "file found"
true
else
echo "File not found"
wget https://github.com/vishnuunni/wget/blob/master/file1
#touch /home/vishnu/Desktop/Script_Hub/test/file1
fi

if [ -f "$file2" ]
then    
#echo "file found"
true
else    
echo "File not found"
wget https://github.com/vishnuunni/wget/blob/master/file2
#touch /home/vishnu/Desktop/Script_Hub/test/file2
fi

if [ -f "$file3" ]
then    
#echo "file found"
true
else
echo "File not found"
wget https://github.com/vishnuunni/wget/blob/master/file3
#touch /home/vishnu/Desktop/Script_Hub/test/file3
fi
sleep 2
if [[ (-f "$file1" && -f "$file2" && -f "$file3") ]];
then
echo "Files found"
fi
