# CI/CD Infrastructure with Monitoring on AWS using Terraform, Ansible & GitHub Actions

![CI](https://img.shields.io/github/actions/workflow/status/alchemistkay/devops-ci-monitoring-infra/terraform-plan.yaml?label=Terraform%20Plan&style=for-the-badge)
![CI](https://img.shields.io/github/actions/workflow/status/alchemistkay/devops-ci-monitoring-infra/terraform-apply.yaml?label=Terraform%20Apply&style=for-the-badge)
![CI](https://img.shields.io/github/actions/workflow/status/alchemistkay/devops-ci-monitoring-infra/ansible-deploy.yaml?label=Ansible%20Provisioning&style=for-the-badge)
![AWS](https://img.shields.io/badge/AWS-EC2%20%7C%20VPC%20%7C%20SG-orange?style=for-the-badge)
![Infrastructure as Code](https://img.shields.io/badge/IaC-Terraform%20%7C%20Ansible-blueviolet?style=for-the-badge)

---

## Project Spotlight

This project demonstrates end-to-end DevOps infrastructure provisioning and CI/CD pipeline configuration using Terraform and Ansible, with GitHub Actions for automation. The infrastructure deploys a Jenkins-based CI stack along with SonarQube, Trivy, and a full monitoring suite using Prometheus and Grafana—all orchestrated on AWS EC2 and provisioned via Docker Compose.

---

## Infrastructure Overview

- **Provisioning Tool**: [Terraform](https://www.terraform.io/)
  - Creates AWS EC2, VPC, Subnets, Security Groups
  - Uses Terraform Cloud for state management
- **Configuration Management**: [Ansible](https://www.ansible.com/)
  - Installs and configures Docker
  - Deploys CI stack (Jenkins, SonarQube, Trivy)
  - Deploys Monitoring stack (Prometheus, Grafana)
- **CI/CD Pipelines**: [GitHub Actions](https://github.com/features/actions)
  - `terraform-plan`: Runs on pull request to generate infrastructure plan
  - `terraform-apply`: Runs on merge to apply infrastructure changes
  - `ansible-deploy`: Manual workflow to configure instances with Ansible
- **Orchestration**: Docker Compose
- **Monitoring Stack**:
  - Prometheus (metrics)
  - Grafana (visualization)
  - Node Exporter, cAdvisor, AlertManager

---

## Project Structure

```bash

📦 infra
├── 📂 ansible
│   ├── 📄 ansible.cfg
│   ├── 📂 playbooks
│   │   ├── 📄 main.yaml
│   │   ├── 📄 setup-ci.yaml
│   │   ├── 📄 setup-monitoring.yaml
│   │   └── 📄 setup-prereqs.yaml
│   └── 📂 roles
│       ├── 📂 ci_stack
│       │   ├── 📂 files
│       │   │   └── 📄 plugins.txt
│       │   ├── 📂 handlers
│       │   │   └── 📄 main.yaml
│       │   ├── 📂 tasks
│       │   │   └── 📄 main.yaml
│       │   ├── 📂 templates
│       │   │   ├── 🐳 Dockerfile
│       │   │   ├── 🐙 docker-compose.yaml.j2
│       │   │   ├── 📄 jenkins.yaml.j2
│       │   │   └── 🌐 nginx.conf.j2
│       │   └── 📂 vars
│       │       └── 📄 main.yaml
│       └── 📂 monitoring_stack
│           ├── 📂 handlers
│           │   └── 📄 main.yaml
│           ├── 📂 tasks
│           │   └── 📄 main.yaml
│           ├── 📂 templates
│           │   ├── 📄 alertmanager.yaml.j2
│           │   ├── 🐙 docker-compose.yaml.j2
│           │   └── 📄 prometheus.yaml.j2
│           └── 📂 vars
│               └── 📄 main.yaml
└── 📂 terraform
    ├── 📄 backend.tf
    ├── 📄 main.tf
    ├── 📂 modules
    │   ├── 📂 compute
    │   │   ├── 📄 main.tf
    │   │   ├── 📄 outputs.tf
    │   │   └── 📄 variables.tf
    │   └── 📂 network
    │       ├── 📄 main.tf
    │       ├── 📄 outputs.tf
    │       └── 📄 variables.tf
    ├── 📄 outputs.tf
    ├── 📄 provider.tf
    ├── 📄 terraform.tfvars
    └── 📄 variables.tf

```

## Highlights

- **Infrastructure-as-Code** with remote state stored in **Terraform Cloud**
- Jenkins pre-installed plugins via `plugins.txt`
- Jenkins configuration as code using **JCasC** (`jenkins.yaml`)
- Modular stack orchestration using **Docker Compose**
- Full monitoring setup with **Prometheus** and **Grafana**
- Integrated **Trivy** for container vulnerability scanning
- Continuous validation with **GitHub Actions** for pull requests and merges

### Jenkins Configuration-as-Code (JCasC)

- Admin user and plugins are provisioned during image build
- Configuration loaded via mounted YAML in `/opt/ci/jenkins/casc_configs/`

---

## How to Run

### 1. Clone the Repo

```bash
git clone https://github.com/alchemistkay/devops-ci-monitoring-infra.git
cd infra
```

### 2. Configure Variables
Edit the following file to match your environment:
```bash
terraform/terraform.tfvars
```

### 3. GitHub Actions Workflow
 Pull Request → `terraform-plan.yaml` runs for validation

 Merge to main → `terraform-apply.yaml` provisions the infrastructure

 Manual Trigger → `ansible-deploy.yaml` configures the EC2 instance with CI & Monitoring stacks

---

## How to Use (Locally)
> Requires: AWS credentials, Terraform installed, Ansible installed

```bash
# 1. Terraform Init & Apply (Or let GitHub Actions handle this)
cd infra/terraform
terraform init
terraform apply

# 2. Run Ansible locally (Or trigger via GitHub Actions)
cd ../ansible
ansible-playbook -i inventory/hosts.ini playbooks/main.yaml
```

---

## Learning Highlights

- Real-world practice with IaC (Terraform) and CM (Ansible)

- Jenkins-as-code and Docker Compose orchestration

- Pipeline-driven infrastructure workflows via GitHub Actions

- Monitoring and observability integration for production readiness

---

## 🧑‍💻 Author

Made with ❤️ by [Kwaku](https://github.com/alchemistkay)


