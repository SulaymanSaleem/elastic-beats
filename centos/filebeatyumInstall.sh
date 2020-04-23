#! /bin/bash

sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
sudo cp elastic.repo /etc/yum.repos.d/
sudo yum install filebeat -y
sudo systemctl enable filebeat

sudo cp filebeat.yml /etc/filebeat/

sudo filebeat modules enable elasticsearch
sudo filebeat modules enable kibana
sudo filebeat modules enable system


sudo filebeat test output
sudo filebeat test config

sudo filebeat setup -e

sudo systemctl start filebeat
