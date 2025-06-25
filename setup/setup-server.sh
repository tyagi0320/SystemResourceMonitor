#!/bin/bash

# Wait for apt lock to release
while sudo fuser /var/lib/dpkg/lock >/dev/null 2>&1 || \
      sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1 || \
      sudo fuser /var/cache/apt/archives/lock >/dev/null 2>&1; do
    echo "[INFO] Waiting for apt lock..."
    sleep 5
done

echo "[INFO] Updating package list..."
sudo apt update -y

echo "[INFO] Installing Docker & Compose plugin..."
sudo apt install -y docker.io docker-compose-plugin git

echo "[INFO] Adding ubuntu user to docker group..."
sudo usermod -aG docker ubuntu

echo "[INFO] Enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "[INFO] Cloning your repo..."
sudo mkdir -p /home/ubuntu/SystemResourceMonitor
sudo git clone https://github.com/tyagi0320/SystemResourceMonitor.git /home/ubuntu/SystemResourceMonitor
sudo chown -R ubuntu:ubuntu /home/ubuntu/SystemResourceMonitor

echo "[INFO] Setup complete ✅"
