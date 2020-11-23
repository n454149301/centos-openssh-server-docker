FROM centos:centos8
MAINTAINER naonao800@163.com

USER root
EXPOSE 10022

RUN yum update -y; yum install -y sudo openssh-server openssh-clients openssh; sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm; sudo dnf install -y ansible
COPY ./entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
