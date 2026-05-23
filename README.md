<div align="center">

```
  ██╗  ██╗ █████╗ ███████╗    ██████╗ ██╗      █████╗ ████████╗███████╗ ██████╗ ██████╗ ███╗   ███╗
  ██║ ██╔╝██╔══██╗██╔════╝    ██╔══██╗██║     ██╔══██╗╚══██╔══╝██╔════╝██╔═══██╗██╔══██╗████╗ ████║
  █████╔╝ ╚█████╔╝███████╗    ██████╔╝██║     ███████║   ██║   █████╗  ██║   ██║██████╔╝██╔████╔██║
  ██╔═██╗ ██╔══██╗╚════██║    ██╔═══╝ ██║     ██╔══██║   ██║   ██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║
  ██║  ██╗╚█████╔╝███████║    ██║     ███████╗██║  ██║   ██║   ██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║
  ╚═╝  ╚═╝ ╚════╝ ╚══════╝    ╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝
```

# enterprise-k8s-platform

**Production-grade Kubernetes platform with GitOps, Service Mesh, FinOps & full Observability**  
*Built by [Ashwani Kumar](https://linkedin.com/in/ashwani547) · CKA Certified · 12+ Years DevOps*

[![Kubernetes](https://img.shields.io/badge/Kubernetes-1.29-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io)
[![Terraform](https://img.shields.io/badge/Terraform-1.7-7B42BC?logo=terraform&logoColor=white)](https://terraform.io)
[![ArgoCD](https://img.shields.io/badge/ArgoCD-2.10-EF7B4D?logo=argo&logoColor=white)](https://argoproj.github.io)
[![Istio](https://img.shields.io/badge/Istio-1.21-466BB0?logo=istio&logoColor=white)](https://istio.io)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

</div>

---

## 🎯 What This Project Solves

Most teams manage Kubernetes by stitching together tools and tribal knowledge. This platform provides a **complete, opinionated, production-ready foundation** that eliminates that chaos:

| Problem | This Platform's Answer |
|---|---|
| Manual, error-prone deployments | GitOps via ArgoCD — git push = production deploy |
| No visibility into what's broken | Full Prometheus + Grafana + ELK + Jaeger observability |
| Cloud bills spiraling out of control | Built-in FinOps dashboards + Kubecost integration |
| Security policies inconsistently applied | OPA/Gatekeeper admission policies enforced cluster-wide |
| Works on one cloud, breaks on another | Terraform modules for EKS, AKS, and GKE — identical UX |

> **Real-world results using this architecture:**  
> ✅ 45% reduction in unplanned downtime  
> ✅ MTTR cut from 4 hours → under 45 minutes  
> ✅ Deployment frequency: bi-weekly → on-demand daily  
> ✅ 25% cloud cost savings via FinOps governance

---

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────────────────────────┐
│                          Developer Workflow                          │
│                                                                     │
│   git push → GitHub Actions CI → Image Build → Helm Chart Update   │
│                                      ↓                             │
│                              ArgoCD (GitOps)                        │
│                                      ↓                             │
└──────────────────────────────────────┬──────────────────────────────┘
                                       │
         ┌─────────────────────────────┼──────────────────────────┐
         │                             │                          │
    ┌────▼────┐                  ┌─────▼─────┐            ┌──────▼──────┐
    │  AWS     │                  │  Azure    │            │  GCP        │
    │  EKS     │                  │  AKS      │            │  GKE        │
    └────┬────┘                  └─────┬─────┘            └──────┬──────┘
         │                             │                          │
         └─────────────────────────────┼──────────────────────────┘
                                       │
                        ┌──────────────▼──────────────┐
                        │     Istio Service Mesh       │
                        │  (mTLS · Traffic Mgmt · RBAC)│
                        └──────────────┬──────────────┘
                                       │
          ┌──────────────┬─────────────┼──────────────┬─────────────────┐
          │              │             │              │                  │
    ┌─────▼──────┐ ┌─────▼──────┐ ┌───▼────┐  ┌─────▼──────┐ ┌────────▼─────┐
    │ OPA        │ │ Prometheus  │ │  ELK   │  │  Jaeger    │ │  Kubecost    │
    │ Gatekeeper │ │ + Grafana   │ │  Stack │  │  Tracing   │ │  (FinOps)   │
    └────────────┘ └────────────┘ └────────┘  └────────────┘ └──────────────┘
```

---

## 📦 Stack & Tools

### Core Platform
| Layer | Tool | Version | Purpose |
|---|---|---|---|
| Orchestration | Kubernetes | 1.29 | Container orchestration |
| IaC | Terraform | 1.7 | Multi-cloud provisioning |
| GitOps | ArgoCD | 2.10 | Continuous delivery |
| Package Mgmt | Helm | 3.14 | Application packaging |
| Service Mesh | Istio | 1.21 | mTLS, traffic management |

### Observability
| Tool | Purpose |
|---|---|
| Prometheus + Alertmanager | Metrics collection & alerting |
| Grafana | Dashboards (SLO, infrastructure, cost) |
| ELK Stack (7.x) | Log aggregation & search |
| Jaeger | Distributed tracing |

### Security
| Tool | Purpose |
|---|---|
| OPA / Gatekeeper | Policy-as-code enforcement |
| HashiCorp Vault | Secrets management |
| Trivy | Container image scanning |
| Falco | Runtime threat detection |

---

## 🚀 Quick Start

### Prerequisites
```bash
# Required tools
terraform >= 1.7
kubectl >= 1.29
helm >= 3.14
argocd CLI >= 2.10
```

### 1. Clone & Configure

```bash
git clone https://github.com/betelabs/enterprise-k8s-platform.git
cd enterprise-k8s-platform

# Copy and fill in your cloud credentials
cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars
```

### 2. Provision the Cluster (pick your cloud)

```bash
# AWS EKS
cd terraform/aws
terraform init && terraform apply

# Azure AKS
cd terraform/azure
terraform init && terraform apply

# GCP GKE
cd terraform/gcp
terraform init && terraform apply
```

### 3. Bootstrap the Platform

```bash
# One script to install: ArgoCD, Istio, OPA, Vault, Observability stack
./scripts/bootstrap/platform-install.sh --env dev --cloud aws
```

### 4. Access ArgoCD UI

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
# Open https://localhost:8080
# Default admin password:
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath='{.data.password}' | base64 -d
```

### 5. Deploy the Demo App

```bash
# Deploy a sample microservice to see the full platform in action
kubectl apply -f apps/demo-app/argocd-app.yaml

# Watch GitOps sync in real time
argocd app get demo-app --watch
```

---

## 📁 Repository Structure

```
enterprise-k8s-platform/
│
├── README.md                          # You are here
├── CONTRIBUTING.md
├── LICENSE
│
├── terraform/                         # Infrastructure as Code
│   ├── modules/
│   │   ├── eks/                       # Reusable EKS module
│   │   ├── aks/                       # Reusable AKS module
│   │   ├── gke/                       # Reusable GKE module
│   │   └── networking/                # VPC/VNET shared module
│   ├── aws/                           # AWS root config
│   ├── azure/                         # Azure root config
│   └── gcp/                           # GCP root config
│
├── helm/                              # Helm charts
│   ├── platform/                      # Platform-level chart (ArgoCD, Istio, OPA)
│   ├── observability/                 # Prometheus, Grafana, ELK, Jaeger
│   └── app-template/                  # Golden-path chart for application teams
│
├── gitops/                            # ArgoCD ApplicationSets & Apps
│   ├── argocd/
│   │   ├── projects/                  # ArgoCD project definitions
│   │   └── applicationsets/           # Dynamic app generation
│   └── apps/
│       ├── platform/                  # Platform components (GitOps managed)
│       └── workloads/                 # Business applications
│
├── policies/                          # OPA / Gatekeeper policies
│   ├── constraints/
│   │   ├── require-resource-limits.yaml
│   │   ├── no-privileged-containers.yaml
│   │   ├── require-labels.yaml
│   │   └── allowed-registries.yaml
│   └── constraint-templates/
│
├── observability/                     # Observability configs
│   ├── dashboards/                    # Grafana dashboard JSONs
│   │   ├── slo-dashboard.json
│   │   ├── cost-dashboard.json
│   │   └── infrastructure.json
│   ├── alerts/                        # Prometheus alerting rules
│   │   ├── slo-burn-rate.yaml
│   │   └── infrastructure.yaml
│   └── runbooks/                      # Alert runbooks (Markdown)
│       ├── high-cpu.md
│       ├── pod-crashlooping.md
│       └── slo-breach.md
│
├── apps/                              # Demo application
│   └── demo-app/
│       ├── src/                       # Simple Go microservice
│       ├── Dockerfile
│       ├── helm/                      # App-specific Helm chart
│       └── argocd-app.yaml
│
├── environments/                      # Per-environment config
│   ├── dev/
│   │   ├── terraform.tfvars.example
│   │   └── values.yaml
│   ├── staging/
│   └── prod/
│
├── scripts/
│   ├── bootstrap/
│   │   └── platform-install.sh        # Full platform bootstrap
│   ├── dr/
│   │   └── failover.sh                # DR runbook automation
│   └── cost/
│       └── cost-report.sh             # Monthly cost summary
│
└── .github/
    └── workflows/
        ├── ci.yaml                    # Build, test, scan images
        ├── terraform-plan.yaml        # PR Terraform plan
        └── release.yaml               # Helm chart release
```

---

## 🔐 Security Model

This platform enforces security at every layer:

```
Request → Istio mTLS → OPA Admission → Runtime (Falco) → Secrets (Vault)
```

### Policy Enforcement (OPA/Gatekeeper)
All workloads are **blocked by default** unless they comply with:
- ✅ Resource limits (`requests` and `limits` required on all containers)
- ✅ No `privileged: true` containers
- ✅ Images from approved registries only
- ✅ Required labels: `app`, `env`, `team`, `version`
- ✅ No `latest` image tag in staging/prod

### Secrets Management
```bash
# Vault dynamic secrets — no static credentials in manifests
vault kv put secret/myapp db_password="$(openssl rand -base64 32)"
```

---

## 📊 SLO Dashboard

Pre-built Grafana dashboards track:

| SLO | Target | Alert Threshold |
|---|---|---|
| Availability | 99.9% | < 99.5% triggers page |
| P99 Latency | < 200ms | > 500ms triggers page |
| Error Rate | < 0.1% | > 1% triggers page |
| Deployment Frequency | Daily | — |

---

## 🌐 GitOps Workflow

```
Developer → git push → GitHub Actions CI
                              ↓
                    Build + scan image (Trivy)
                              ↓
                    Update Helm chart values.yaml
                              ↓
                    ArgoCD detects diff (2-min sync)
                              ↓
                    Canary → 10% → 50% → 100% rollout
                              ↓
                    Automated rollback if error budget breached
```

---

## 💰 Cost Optimization Built-In

Kubecost is deployed and pre-configured with:
- Per-namespace cost allocation
- Idle resource detection
- Savings recommendations
- Monthly cost report via `scripts/cost/cost-report.sh`

---

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). PRs welcome for:
- New cloud provider modules
- Additional OPA policies
- Grafana dashboard improvements
- Documentation fixes

---
## 👤 Author

<p align="left">
  <a href="https://github.com/betelabs" target="_blank">
    <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"/>
  </a>

  <a href="https://linkedin.com/in/ashwani547" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-Ashwani%20Kumar-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white"/>
  </a>

  <a href="mailto:hello@betelabs.com">
    <img src="https://img.shields.io/badge/Email-Contact-D14836?style=for-the-badge&logo=gmail&logoColor=white"/>
  </a>
</p>

### Ashwani Kumar
Head of DevOps • Kubernetes Engineer • Cloud Native Enthusiast

---

<div align="center">
  <sub>
    ⭐ If this project helped you, consider starring the repository to support the project.
  </sub>
</div>

