#!/bin/bash
echo ""
echo -n "Enter the username to be added : "
read u_name
useradd $u_name
status=$(echo "$?")
if [ $status != 0 ]
then
	echo ""
	echo "Something went wrong [error] ! "
	echo ""
	exit
else
mkdir -p /home/$u_name/.ssh
fi
echo ""
echo -n "Paste the public key here : "
read key
echo "$key" >> /home/$u_name/.ssh/authorized_keys
status=$(echo "$?")
if [ $status != 0 ]
then
	echo "Something went wrong [error] ! "
	echo ""
	exit
else
chown -R $u_name:$u_name /home/$u_name/
chmod -R 700 /home/$u_name/.ssh
echo "$u_name ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$u_name_sudo
chmod 440 /etc/sudoers.d/$u_name_sudo
echo ""
echo "User $u_name successfully added"
echo ""
fi
