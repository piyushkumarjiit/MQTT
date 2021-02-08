#!/bin/bash
#Author: piyushkumar.jiit@gmail.com

# Add repo keys
wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
sudo apt-key add mosquitto-repo.gpg.key

# Add MQTT repo to list - For Buster
echo "deb https://repo.mosquitto.org/debian buster main" | sudo tee -a /etc/apt/sources.list.d/raspi.list

# Call update and then install mosquitto
sudo apt-get update
sudo apt-get install mosquitto
sudo apt-get install mosquitto-clients

# T modify any configurations
#nano /etc/mosquitto/mosquitto.conf

sudo systemctl --system daemon-reload
sudo systemctl enable mosquitto.service
sudo systemctl start mosquitto.service
