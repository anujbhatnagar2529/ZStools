#!/bin/bash
echo "Installing SSH-PASS Tool started at $(date)"
echo 123456 | sudo -S yum install make wget -y
echo 123456 | sudo -S yum groupinstall "Development Tools" -y

echo "Remove Previous SSH-PASS Tool Files if present"
ls -ltr sshpass.tar.gz*
rm -Rf sshpass.tar.gz*

echo "SSH-PASS downloading..."
wget http://sourceforge.net/projects/sshpass/files/latest/download -O sshpass.tar.gz
tar -xvf sshpass.tar.gz
cd sshpass-1.06
./configure
echo 123456 | sudo -S make install
echo "Checking the sshpass tool..."
/usr/local/bin/sshpass -h
echo "Installing SSH-PASS Tool Completed at $(date)"

echo "Modifying sshd configuration..."
sudo sed -i 's/\#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/\PasswordAuthentication no/\#PasswordAuthentication no/g' /etc/ssh/sshd_config
sudo egrep -i "PasswordAuthentication" /etc/ssh/sshd_config

echo "Restarting sshd service..."
sudo service sshd restart

scp ~/.ssh/id_rsa.pub zsb1@172.31.42.71:/home/zsb1/workspace/ZSDeploy/jenkins.war zss1@172.31.44.80:/tmp/
scp ~/.ssh/id_rsa.pub zsb1@172.31.42.71:/home/zsb1/workspace/ZSDeploy/apache-tomcat-8.5.51.tar.gz zss1@172.31.44.80:/tmp/
scp ~/.ssh/id_rsa.pub zsb1@172.31.42.71:/home/zsb1/workspace/ZSDeploy/sshpass.tar.gz zss1@172.31.44.80:/tmp/
