#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo yum list installed | grep httpd >> /tmp/package-installed-list.txt


