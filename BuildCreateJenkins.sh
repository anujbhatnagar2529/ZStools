#!/bin/bash
echo "Build Process for Jenkins Begin at - $(date)"

echo "Remove Previous Jenkins Files if present"
ls -ltr jenkins.war*
rm -Rf jenkins.war*

echo "Build Process Downloading war file for Jenkins - Deployment PreReq"
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war

pwd
ls -ltr jenkins.war

echo "Give required permissions"
chmod 777 jenkins.war

echo "Build Process for Jenkins Completed at - $(date)"
