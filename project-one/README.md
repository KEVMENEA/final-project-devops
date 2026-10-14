# Project One — DevOps Infrastructure Automation with Ansible on GCP

## Overview

This project automates the provisioning, configuration, and destruction of a DevOps environment on Google Cloud Platform (GCP) using Ansible.

The environment contains three Ubuntu 24.04 LTS virtual machines:

| Server | Purpose | Application Port |
|---|---|---:|
| Jenkins Server | CI/CD | 8080 |
| SonarQube Server | Code Quality | 9000 |
| Nexus Server | Artifact Repository | 8081 |

The applications run with Docker and are exposed through NGINX reverse proxies with HTTPS certificates managed by Certbot.

## Architecture

```text
                     Local Machine / WSL2
                        Ansible Control
                              |
                         SSH through IAP
                              |
              +---------------+---------------+
              |               |               |
              v               v               v
        Jenkins VM       SonarQube VM      Nexus VM
        Ubuntu 24.04     Ubuntu 24.04      Ubuntu 24.04
              |               |               |
           Docker           Docker           Docker
              |               |               |
          Jenkins       SonarQube + DB        Nexus
          :8080             :9000             :8081
              |               |               |
            NGINX           NGINX             NGINX
              |               |               |
            HTTPS           HTTPS             HTTPS
exit
