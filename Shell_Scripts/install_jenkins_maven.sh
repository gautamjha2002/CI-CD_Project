#!/bin/bash
sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
# installing Java
sudo yum install java-11-openjdk -y
# installing Maven
sudo yum install maven -y
Installing Jenkins
sudo yum install jenkins -y
sudo systemctl daemon-reload 
# now starting jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins