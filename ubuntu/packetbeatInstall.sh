#! /bin/bash

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update && sudo apt-get install packetbeat
sudo update-rc.d packetbeat defaults 95 10

sudo rm -rf /../etc/packetbeat/packetbeat.yml
sudo cp packetbeat.yml /../etc/packetbeat/packetbeat.yml

sudo packetbeat test output
sudo packetbeat test config
sudo packetbeat setup -e

sudo systemctl start packetbeat
