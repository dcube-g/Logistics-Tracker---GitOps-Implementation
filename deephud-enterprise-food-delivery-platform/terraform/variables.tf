variable "subscription_id" {
  type = string
}

variable "location" {
  default = "South India"
}

variable "resource_group_name" {
  default = "rg-deephud-prod-southindia"
}

variable "acr_name" {
  default = "acrdeephudprod01"
}

variable "aks_name" {
  default = "aks-deephud-prod-01"
}

variable "vm_size" {
  default = "Standard_D2as_v5"
}
