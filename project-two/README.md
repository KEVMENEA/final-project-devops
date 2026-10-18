# Project Two - HA Kubernetes & GitOps CI/CD

## Overview

This project deploys a highly available Kubernetes cluster on Google Cloud Platform using Ansible and Kubespray.

The platform includes:

- 3 Kubernetes control-plane/etcd nodes
- 3 Kubernetes worker nodes
- Calico networking
- Traefik Ingress Controller
- Google Cloud external load balancer
- cert-manager with Let's Encrypt
- Headlamp Kubernetes dashboard
- Argo CD GitOps
- ReactJS application
- GitHub Actions CI
- GitHub Container Registry (GHCR)

## Kubernetes Cluster

| Node | Role | Private IP |
|---|---|---|
| k8s-cp01 | Control Plane / etcd | 10.20.0.11 |
| k8s-cp02 | Control Plane / etcd | 10.20.0.12 |
| k8s-cp03 | Control Plane / etcd | 10.20.0.13 |
| k8s-worker01 | Worker | 10.20.0.21 |
| k8s-worker02 | Worker | 10.20.0.22 |
| k8s-worker03 | Worker | 10.20.0.23 |

Kubernetes version: `v1.36.4`

## GCP Infrastructure

- Project: `cs-project-huenwcu3`
- Region: `asia-southeast2`
- Zone: `asia-southeast2-b`
- VPC: `k8s-network`
- Subnet: `k8s-subnet`
- CIDR: `10.20.0.0/24`
- Public ingress IP: `34.50.125.36`

## Public Services

| Service | URL |
|---|---|
| Headlamp | https://headlamp.meneakevit.store |
| Argo CD | https://argocd.meneakevit.store |
| ReactJS App | https://app.meneakevit.store |

All public services use HTTPS certificates issued by Let's Encrypt through cert-manager.

## CI/CD Architecture

```text
Developer
    |
    v
GitHub
    |
    v
GitHub Actions
    |
    v
GHCR
    |
    v
Argo CD
    |
    v
Kubernetes
    |
    v
Traefik
    |
    v
ReactJS Application
wq
