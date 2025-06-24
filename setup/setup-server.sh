#!/bin/bash


# Wait for apt lock to release
while sudo fuser /var/lib/dpkg/lock >/dev/null 2>&1 || \
      sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1 || \
      sudo fuser /var/cache/apt/archives/lock >/dev/null 2>&1; do
    echo "[INFO] Waiting for apt lock..."
    sleep 5
done


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
