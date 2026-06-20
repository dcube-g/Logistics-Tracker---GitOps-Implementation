cat > variables.sh <<'EOF'
export LOCATION="eastus"
export RESOURCE_GROUP="rg-freelogistics-prod-eastus"
export AKS_CLUSTER="aks-freelogistics-prod-01"
export ACR_NAME="acrfreelogistics"
export VNET_NAME="vnet-freelogistics-prod-eastus"
export NODE_COUNT=2
export VM_SIZE="Standard_B2ats_v2"
EOF
