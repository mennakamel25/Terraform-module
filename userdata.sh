#!/bin/bash
# userdata.sh
# Installs NGINX and deploys the "Gotto Job" static website.
# This script runs automatically when the EC2 instance first boots.

set -e  # Exit immediately on any error

echo "==> Updating package lists..."
sudo apt update -y

echo "==> Installing NGINX..."
sudo apt install -y nginx

echo "==> Installing unzip..."
sudo apt install -y unzip

echo "==> Downloading Gotto Job website template..."
cd /tmp
wget -q https://www.tooplate.com/zip-templates/2134_gotto_job.zip

echo "==> Extracting website files..."
unzip -o 2134_gotto_job.zip

echo "==> Deploying website to NGINX web root..."
sudo cp -r /tmp/2134_gotto_job/* /var/www/html/

echo "==> Starting NGINX..."
sudo systemctl start nginx
sudo systemctl enable nginx

echo "==> Deployment complete! NGINX is serving the Gotto Job website."
