#! /bin/bash

sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
sudo cp elastic.repo /etc/yum.repos.d/
sudo yum install metricbeat -y
sudo systemctl enable metricbeat

sudo cp metricbeat.yml /etc/metricbeat/metricbeat.yml

sudo metricbeat modules enable elasticsearch
sudo metricbeat modules enable kibana
sudo metricbeat modules enable system

sudo metricbeat test output
sudo metricbeat test config

sudo metricbeat setup -e

sudo systemctl start metricbeat
sudo systemctl status metricbeat
