FROM centos:centos8
MAINTAINER naonao800@163.com

USER root
EXPOSE 10022

# COPY ./CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
# RUN yum clean all; yum makecache; yum update -y; yum install -y sudo openssh-server openssh-clients openssh; sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm; sudo dnf install ansible
RUN yum update -y; yum install -y sudo openssh-server openssh-clients openssh; sudo dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm; sudo dnf install ansible
COPY ./entrypoint.sh /usr/bin/entrypoint.sh

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
