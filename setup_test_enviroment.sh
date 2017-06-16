#! /bin/bash

yes | yum install wget
yes | yum install tar
sudo yum install epel-release -y
sudo yum update -y
sudo shutdown -r now
sudo yum install -y java-1.8.0-openjdk
echo "JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" | sudo tee -a /etc/profile
source /etc/profile
cd
wget https://archive.apache.org/dist/activemq/5.14.3/apache-activemq-5.14.3-bin.tar.gz
sudo tar -zxvf apache-activemq-5.14.3-bin.tar.gz -C /opt
sudo ln -s /opt/apache-activemq-5.14.3 /opt/activemq
