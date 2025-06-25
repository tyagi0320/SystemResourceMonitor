#!/bin/bash

# Log to console and file
exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

echo "[INFO] Waiting for apt lock to release..."
while sudo fuser /var/lib/dpkg/lock >/dev/null 2>&1 || \
      sudo fuser /var/lib/apt/lists/lock >/dev/null 2>&1 || \
      sudo fuser /var/cache/apt/archives/lock >/dev/null 2>&1; do
    echo "[INFO] Waiting for apt lock..."
    sleep 5
done

echo "[INFO] Installing Docker and Docker Compose v2..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo "[INFO] Adding user 'ubuntu' to Docker group..."
usermod -aG docker ubuntu

echo "[INFO] Cloning SystemResourceMonitor repo..."
mkdir -p /home/ubuntu/SystemResourceMonitor
git clone https://github.com/tyagi0320/SystemResourceMonitor.git /home/ubuntu/SystemResourceMonitor
chown -R ubuntu:ubuntu /home/ubuntu/SystemResourceMonitor

echo "[INFO] Done. Reboot may be needed to apply Docker group changes."
