#!/bin/bash

echo "[INFO] Updating package list..."
apt update -y

echo "[INFO] Installing required packages..."
apt install -y docker.io docker-compose git

echo "[INFO] Adding ubuntu to docker group..."
usermod -aG docker ubuntu

echo "[INFO] Enabling and starting Docker service..."
systemctl enable docker
systemctl start docker

echo "[INFO] Cloning your repo..."
mkdir -p /home/ubuntu/SystemResourceMonitor
git clone https://github.com/tyagi0320/SystemResourceMonitor.git /home/ubuntu/SystemResourceMonitor
chown -R ubuntu:ubuntu /home/ubuntu/SystemResourceMonitor

echo "[INFO] Setup complete ✅"
