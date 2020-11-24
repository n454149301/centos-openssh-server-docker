#! /bin/bash

rm -rfd n454149301-centos-openssh-server-centos8.tar
rm -rfd n454149301-centos-openssh-server-centos8.tar.xz
sudo docker save "n454149301/centos-openssh-server:centos8" -o n454149301-centos-openssh-server-centos8.tar
sudo xz -v n454149301-centos-openssh-server-centos8.tar
