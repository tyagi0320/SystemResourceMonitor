
# 🖥️ System Resource Monitor

A full-stack DevOps project that provisions cloud infrastructure, deploys a web app, and monitors system metrics using Prometheus and Grafana — all with complete automation using Docker, Terraform, and CI/CD.

---

## 📌 Project Overview

**System Resource Monitor** is a production-style DevOps project that showcases:

- 🏗️ **Infrastructure-as-Code** with Terraform
- 🐳 **Dockerized App and Monitoring Stack**
- 📊 **System Monitoring** with Prometheus + Grafana
- 🔄 **CI/CD Pipeline** (via GitHub Actions)
- ☁️ **Deployment on AWS EC2**

---

## 🛠️ Tech Stack

| Layer        | Tool/Service         |
|--------------|----------------------|
| Infrastructure | Terraform (AWS EC2, Security Groups) |
| Provisioning   | Cloud-init (`user_data` in Terraform) |
| App Container  | Docker |
| Orchestration  | Docker Compose |
| Monitoring     | Prometheus, Node Exporter |
| Visualization  | Grafana |
| CI/CD Pipeline | GitHub Actions |
| OS/Cloud       | Ubuntu on AWS EC2 (t2.micro) |

---

## 🧱 Project Architecture

```plaintext
                      ┌────────────────────────┐
                      │     GitHub Actions     │
                      │   (CI/CD Deployment)   │
                      └────────────┬───────────┘
                                   │
                     ┌────────────▼────────────┐
                     │     AWS EC2 Instance    │
                     │  (Ubuntu, Docker-ready) │
                     └────────────┬────────────┘
                                  │
             ┌───────────────────┴───────────────────┐
             │                                       │
      ┌──────▼──────┐                       ┌────────▼────────┐
      │ Web App     │                       │ Monitoring Stack│
      │ (Node/React)│                       │ Prometheus      │
      └─────────────┘                       │ Grafana         │
                                            │ Node Exporter   │
                                            └─────────────────┘

## ⚙️ Features

- ✅ Launch infrastructure with `terraform apply`
- ✅ Automatically installs Docker, clones repo via `user_data`
- ✅ One-command deployment via `docker-compose up -d`
- ✅ Visual dashboards via Grafana
- ✅ CI/CD auto-deploy via GitHub Actions
- ✅ Monitoring of CPU, memory, disk, network usage

---

## 🚀 Getting Started

### 1️⃣ Clone the Repo

```bash
git clone https://github.com/tyagi0320/SystemResourceMonitor.git
cd SystemResourceMonitor/terraform
```

### 2️⃣ Deploy Infrastructure (Terraform)

```bash
terraform init
terraform apply
```

### 3️⃣ SSH into Server

```bash
ssh -i path/to/srm_key.pem ubuntu@<EC2_PUBLIC_IP>
```

### 4️⃣ Launch the App

```bash
cd /home/ubuntu/SystemResourceMonitor/monitoring
docker-compose up -d
```

### 🔍 Access Services

| Service       | URL |
|---------------|-----|
| App UI        | `http://<EC2-IP>:3000` |
| Prometheus    | `http://<EC2-IP>:9090` |
| Grafana       | `http://<EC2-IP>:3001` |
| Node Exporter | `http://<EC2-IP>:9100/metrics` |

---

## 📊 Grafana Setup

1. Login at `http://<EC2-IP>:3001` (user: `admin`, pass: `admin`)
2. Add Prometheus data source: `http://prometheus:9090`
3. Import dashboard: use **Dashboard ID `1860`**

---

## 🔄 CI/CD Pipeline

- Uses GitHub Actions for deployment automation
- Auto-deploys on `main` branch push
- Docker images rebuilt and re-deployed via SSH

---

## 🧠 Why This Project Matters

- Demonstrates end-to-end DevOps workflow
- Reproducible cloud infrastructure
- Real-world system monitoring
- Shows mastery of IAC, Docker, CI/CD, observability
- Great portfolio project for DevOps/SRE roles

---

## 📂 Directory Structure

```
SystemResourceMonitor/
│
├── terraform/               # Infrastructure code
│   └── main.tf              # EC2 instance, security groups
│
├── monitoring/              # Docker Compose and app setup
│   ├── docker-compose.yml
│   └── prometheus/
│       └── prometheus.yml
│
└── .github/workflows/       # CI/CD GitHub Actions config
    └── deploy.yml
```

---

## ✅ Future Improvements

- Add SSL and NGINX reverse proxy
- Add AlertManager for Prometheus
- Expand metrics to include app-level (via Prometheus client)
- Switch to ECS/Kubernetes for scalability

---

## 🙌 Maintainer

**Harshit Tyagi**  
[GitHub Profile](https://github.com/tyagi0320)

---

## 📄 License

MIT — free to use for learning and demonstration
