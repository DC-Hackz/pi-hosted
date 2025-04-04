#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

echo "Creating directories..."
sudo mkdir -p /portainer/authentik/certs || error "Failed to create certs directory!"
sudo mkdir -p /portainer/authentik/custom-templates || error "Failed to create custom-templates directory!"
sudo mkdir -p /portainer/authentik/media || error "Failed to create media directory!"
sudo mkdir -p /portainer/authentik/geoip || error "Failed to create geoip directory!"
sudo mkdir -p /portainer/authentik/redis || error "Failed to create redis directory!"
sudo mkdir -p /portainer/authentik/postgre || error "Failed to create postgre directory!"

echo "Setting permissions..."
sudo chown -R 1000:1000 /portainer/authentik/certs || error "Failed to set permissions for Authentik certs!"
sudo chown -R 1000:1000 /portainer/authentik/custom-templates || error "Failed to set permissions for Authentik custom-templates!"
sudo chown -R 1000:1000 /portainer/authentik/media || error "Failed to set permissions for Authentik media!"
sudo chown -R 1000:1000 /portainer/authentik/geoip || error "Failed to set permissions for Authentik geoip!"
sudo chown -R 999:999 /portainer/authentik/redis || error "Failed to set permissions for Authentik redis!"
sudo chown -R 70:70 /portainer/authentik/postgre || error "Failed to set permissions for Authentik postgre!"
echo "Done You are ready to goto next step in the install document"
