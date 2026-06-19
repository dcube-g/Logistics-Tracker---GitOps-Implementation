---
name: "🏗️ Infrastructure Setup Task"
about: Track the provisioning of Azure resources, AKS, and Kubernetes namespaces.
title: "[INFRA] Create Azure Base Layer"
labels: ["cloud-infrastructure", "azure"]
assignees: []
---

## Task Description
Set up the core Azure and Kubernetes infrastructure required for the Logistics Dispatch Tracker project.

## Checklist
- [ ] Create the Resource Group `rg-freelogistics-prod-eastus`
- [ ] Provision Azure Container Registry `acrfreelogistics` with the Basic SKU
- [ ] Deploy the AKS cluster using the free management tier and `Standard_B2ats_v2` VMs
- [ ] Attach the ACR registry to the AKS cluster using Azure RBAC permissions
- [ ] Create the target namespaces: `logistic-shipping-prod`, `argocd`, and `infra-monitoring`

## Verification Commands
```bash
az aks get-credentials --resource-group rg-freelogistics-prod-eastus --name aks-freelogistics-prod-01
kubectl get nodes -o wide
```
