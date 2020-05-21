#! /bin/bash

#Install script for filebeat

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install filebeat
sudo update-rc.d filebeat defaults 95 10

#Replace filebeat yaml file
sudo rm -rf /etc/filebeat/filebeat.yml
sudo cp filebeat.yml /etc/filebeat/
sudo cp ../es_certs/ /etc/filebeat/ -r
#Enable modules
sudo filebeat modules enable elasticsearch
sudo filebeat modules enable system
sudo filebeat modules enable kibana
#Test output connection and config
sudo filebeat test output
sudo filebeat test config
#Setup kibana dashboards
sudo filebeat setup -e
#Start filebeat
sudo systemctl enable filebeat
sudo systemctl start filebeat
