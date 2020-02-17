#!/bin/bash
echo 123456 | sudo -S  yum install java-1.8* iptables -y	
java -version
tar -xvf /tmp/apache-tomcat-8.5.51.tar.gz
echo 123456 | sudo -S  mv apache-tomcat-8.5.51 /usr/local/tomcat8
echo "export CATALINA_HOME="/usr/local/tomcat8"" >> ~/.bashrc
source ~/.bashrc
cd /usr/local/tomcat8/bin
./startup.sh 
hostname
echo "Check the ApacheTomcat Page here"
echo "http://$(hostname):8080"
