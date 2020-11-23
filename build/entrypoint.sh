#! /bin/bash

sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
echo "root:root" | chpasswd
mkdir -p /root/.ssh
chmod 700 /root/.ssh

if [ -f "/root/.ssh/authorized_keys" ]; then
	echo "get /root/.ssh/authorized_keys"
else
	touch /root/.ssh/authorized_keys
fi

chmod 600 /root/.ssh/authorized_keys

echo 'Host *' > /root/.ssh/config
echo 'StrictHostKeyChecking no' >> /root/.ssh/config
chmod 600 /root/.ssh/config

if [ -f "/etc/ssh/ssh_host_dsa_key" ]; then
	echo "get /etc/ssh/ssh_host_dsa_key"
else
	ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
fi

if [ -f "/etc/ssh/ssh_host_rsa_key" ]; then
	echo "get /etc/ssh/ssh_host_rsa_key"
else
	ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
fi

if [ -f "/root/.ssh/id_rsa" ]; then
	echo "get /root/.ssh/id_rsa"
else
	ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa
fi
mkdir -p /var/run/sshd

chown -R root:root /root/.ssh
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys

echo "get cmd:" $*
if [ -z "$*" ]; then
	/usr/sbin/sshd -D -p 10022
else
	/usr/sbin/sshd -D -p 10022 &
	$*
fi
