#!/bin/bash

#Description: This is a script to download sonarqube
#Author:

 


echo "installing java 11"
sleep 2
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
sleep 2

echo "Download SonarQube latest versions "
cd /opt 
sudo yum install wget -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sleep 2


echo "Etracting packages"
sleep 2
sudo yum install -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip
sleep 2

echo "changing what onwership to user and switch to linux binaries"
sleep 2
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start
sleep 2


sudo firewall-cmd --permanent --add-port=9000/tcp

echo "checking ip address"
sleep 2
hostname -I | awk '{print$2}'

echo type the above IP address followed by ':9000' as the url
