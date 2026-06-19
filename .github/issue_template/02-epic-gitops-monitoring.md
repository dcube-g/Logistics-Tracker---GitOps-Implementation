---
name: "🚀 GitOps & Monitoring Deployment"
about: Track the installation of Argo CD and Prometheus Node Exporter.
title: "[GITOPS-MONITOR] Setup Pipelines & Telemetry"
labels: ["continuous-delivery", "observability"]
assignees: []
---

## Task Description
Deploy Argo CD and Prometheus Node Exporter to handle automated rollouts and resource monitoring on the burstable nodes.

## Checklist
- [ ] Install the lightweight Argo CD manifest bundle into the `argocd` namespace
- [ ] Extract the initial administrative password for the Argo CD panel
- [ ] Establish the local port-forwarding link to test dashboard connectivity
- [ ] Install Prometheus Node Exporter via the Helm repository into `infra-monitoring`
- [ ] Verify that a monitoring pod is successfully running on every node

## Verification Commands
```bash
# Check Argo CD Pods
kubectl get pods -n argocd

# Check Prometheus Node Exporter DaemonSet
kubectl get pods -n infra-monitoring -l app.kubernetes.io/name=node-exporter
```
