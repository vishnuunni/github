#!/bin/bash
 echo -n "Enter the name : "
 read name
 echo "$name" >> /home/vishnu/Desktop/Script_Hub/name.txt
 echo -n "Do you want to add more names [y/n]?"
 read input
 if [ $input = "y" ]
 then
 echo "Opening file..."
 vi /home/vishnu/Desktop/Script_Hub/name.txt
 else
 echo "Proceeding"
 echo -n "Entered name are :"
 cat /home/vishnu/Desktop/Script_Hub/name.txt
 exit
 fi
