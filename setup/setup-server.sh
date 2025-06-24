# setup-server.sh

#!/bin/bash

# Update package list
sudo apt update -y

# Install required packages
sudo apt install -y docker.io docker-compose git

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

# Enable Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Create app directory
mkdir -p ~/app

# Clone your app repo
git clone https://github.com/tyagi0320/SystemResourceMonitor.git ~/app

