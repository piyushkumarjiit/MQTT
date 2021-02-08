#!/bin/bash
#Author: piyushkumar.jiit@gmail.com

# To run Zibee2mqtt on standalone linux box
#Fetch connected devices
ls -l /dev/ttyACM0

# Setup Node.js repository
sudo curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Install Node.js;
sudo apt-get install -y nodejs git make g++ gcc

# Verify that the correct nodejs and npm (automatically installed with nodejs)
node --version  # Should output v12.X or v10.X
npm --version  # Should output 6.X

# Clone Zigbee2MQTT repository
sudo git clone https://github.com/Koenkk/zigbee2mqtt.git /opt/zigbee2mqtt
sudo chown -R pi:pi /opt/zigbee2mqtt

# Install dependencies (as user "pi")
cd /opt/zigbee2mqtt
npm ci --production

# Edit the Config file and add server auth details -TBD
nano /opt/zigbee2mqtt/data/configuration.yaml

# Edit Config file to use custom key
nano /opt/zigbee2mqtt/data/configuration.yaml
advanced:
    network_key: GENERATE

# Edit the Config file and add frontend config
nano /opt/zigbee2mqtt/data/configuration.yaml
frontend:
  # Optional, default 8080
  port: 8080
  # Optional, default 0.0.0.0
  host: 0.0.0.0
  # Optional, enables authentication, disabled by default
  auth_token: your-secret-token


# Start 
cd /opt/zigbee2mqtt
npm start

sudo nano /etc/systemd/system/zigbee2mqtt.service

sudo systemctl --system daemon-reload

sudo systemctl enable zigbee2mqtt.service
# Start Zigbee2MQTT
sudo systemctl start zigbee2mqtt

#Check log
sudo systemctl status zigbee2mqtt -l

# Show status
systemctl status zigbee2mqtt.service