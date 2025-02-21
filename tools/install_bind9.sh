#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

function check_internet() {
  printf "Checking if you are online..."
  wget -q --spider http://github.com
  if [ $? -eq 0 ]; then
    echo "Online. Continuing."
  else
    error "Offline. Go connect to the internet then run the script again."
  fi
}

check_internet

echo "Creating directories..."
sudo mkdir -p /portainer/bind9/ || error "Failed to create config directory!"
sudo mkdir -p /portainer/bind9/cache/ || error "Failed to create data directory for Cache!"
sudo mkdir -p /portainer/bind9/bind/ || error "Failed to create data directory for Bind"
echo "Downloading Prometheus config files if they don't exist"
if [ -d /portainer/bind9/named.conf ];
then
    echo "/portainer/bind9/named.conf is a directory removing"
    rm -rf '/portainer/bind9/named.conf'
fi

if [ ! -f /portainer/bind9/named.conf ]; 
then
	sudo wget -O /portainer/bind9/named.conf https://raw.githubusercontent.com/DC-Hackz/pi-hosted/refs/heads/master/configs/bind9/named.conf || error "Failed to download named.conf file!"
fi

echo "Done You are ready to goto next step in the install document"
