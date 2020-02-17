#!/bin/bash
echo "Build Process for ApacheTomcat Begin at - $(date)"

echo "Remove Previous ApacheTomcat Files if present"
ls -ltr apache-tomcat-8.5.51.tar.gz*
rm -Rf apache-tomcat-8.5.51.tar.gz*

echo "Build Process Downloading war file for ApacheTomcat - Deployment PreReq"
wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.51/bin/apache-tomcat-8.5.51.tar.gz

pwd
ls -ltr apache-tomcat-8.5.51.tar.gz

echo "Give required permissions"
chmod 777 apache-tomcat-8.5.51.tar.gz*

echo "Build Process for ApacheTomcat Completed at - $(date)"
