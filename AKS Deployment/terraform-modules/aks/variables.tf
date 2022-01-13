variable "AKS_LAWName" {
  type        = string
  default     = ""
  description = "Log Analytics work space name to use for AKS cluster"
  validation {
    condition     = length(var.AKS_LAWName) > 6 && can(regex("dev", lower(var.AKS_LAWName)))
    error_message = " The AKS_LAWName must be valied name, shold contain\" dev \" . This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "AKS_LAWSKU" {
  type        = string
  default     = "PerGB2018"
  description = "AKS LAW SKU type to use "
}
variable "AKS_ClusterName" {
  type        = string
  default     = ""
  description = "Name of the AKS cluster to create"
  validation {
    condition     = length(var.AKS_ClusterName) > 6 && can(regex("dev", lower(var.AKS_ClusterName)))
    error_message = " The AKS_ClusterName must be valied name, shold contain\" dev \" . This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "AKS_DNSPrefix" {
  type        = string
  default     = ""
  description = "DNS Prefix to use for AKS cluster"
}
variable "AKS_NodePoolName" {
  type        = string
  default     = "default"
  description = "AKS Node Pool Name - max length 12 chars only"
}
variable "AKS_NodeCount" {
  type        = number
  default     = 2
  description = "Node count in AKS Node pool"
}
variable "AKS_MaxPodsPerNode" {
  type        = number
  default     = 50
  description = "Max Pods allowed in AKS Node pool"
}
variable "AKS_NodeVmSize" {
  type        = string
  default     = "Standard_B2ms"
  description = "AKS Node pool VM size to deploy"
}
variable "AKS_NodeVmOSDiskSize" {
  type        = number
  default     = 30
  description = "AKS Node pool VM OS disk size"
}
variable "AKS_LoadBalancerSKU" {
  type        = string
  default     = "Standard"
  description = "AKS Load balancer SKU to use"
}
variable "AKS_NetworkPlugin" {
  type        = string
  default     = "azure"
  description = "ALS Network plugin to use azure defined or kubenet"
}
variable "AKS_SPClientID" {
  type        = string
  default     = ""
  description = "Service Priniciple ID to use in AKS deployment, this value should be fetch from key-vault"
}
variable "AKS_ClientSecret" {
  type        = string
  sensitive   = true
  default     = ""
  description = "Service Priniciple secret to use in AKS deployment, fetched from key-vault"
}
variable "AKS_Version" {
  type        = string
  default     = "1.19.11"
  description = "AKS version to use while deploying"
}
variable "AKS_PrivateClusterEnabled" {
  type        = bool
  default     = false
  description = "Is AKS private cluster enabled"
}
variable "AKS_EnableKubeDashboard" {
  type        = bool
  default     = false
  description = "Enable the kube dashboard"
}
variable "location" {
  type        = string
  default     = "eastus2"
  description = "location for aks cluster deployment"
  validation {
    condition     = contains(["eastus2", "centralus"], lower(var.location))
    error_message = "Unsupported Azure Region specified for AKS. Only East US2 and Central US Azure Regions are supported."
  }
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}
variable "aks_subnet_id" {
  type        = string
  default     = ""
  description = "Subnet to use for AKS cluster, fetched from module."
}