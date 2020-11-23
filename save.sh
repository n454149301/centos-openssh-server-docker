#! /bin/bash

rm -rfd n454149301-centos-openssh-server-centos8.tar
sudo docker save "n454149301/centos-openssh-server:centos8" -o n454149301-centos-openssh-centos8.tar
