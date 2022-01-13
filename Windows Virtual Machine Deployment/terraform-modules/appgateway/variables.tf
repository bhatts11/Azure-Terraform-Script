variable "appgtwy_PublicIPName" {
  type        = string
  default     = ""
  description = "Pubplic IP name to use for APP Gateway"
  validation {
    condition     = length(var.appgtwy_PublicIPName) > 6 && can(regex("dev", lower(var.appgtwy_PublicIPName)))
    error_message = " The appgtwy_PublicIPName must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "appgtwy_AllocationMethod" {
  type        = string
  default     = "Static"
  description = "Allocation method for APP Gateway"
}
variable "appgtwy_PipSKU" {
  type        = string
  default     = "Standard"
  description = "SKU to use for APP Gateway"
}
variable "appgtwy_MSIName" {
  type        = string
  default     = ""
  description = "MSI Name to use for APP Gateway"
  validation {
    condition     = length(var.appgtwy_MSIName) > 6 && can(regex("dev", lower(var.appgtwy_MSIName)))
    error_message = "The appgtwy_MSIName must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "appgtwy_BackendAddressPool" {
  type        = string
  default     = ""
  description = "APP Gateway bacend address pool name"
}
variable "appgtwy_FrontEndPort" {
  type        = string
  default     = ""
  description = "APP Gateway front end port name "
}
variable "appgtwy_FrondEndIPConfig" {
  type        = string
  default     = ""
  description = "APP Gateway Front end IP configuration name "
}
variable "appgtwy_HttpSetting" {
  type    = string
  default = ""
}
variable "appgtwy_ListenrHttp" {
  type        = string
  default     = ""
  description = "APP Gatewat HTTP Listner name"
}
variable "appgtwy_RequetRoutingRule" {
  type        = string
  default     = ""
  description = "APP Gateway Routing rule name"
}
variable "appgtwy_RedirectConfig" {
  type        = string
  default     = ""
  description = "APP Gateway redirection configuration name"
}
variable "appgtwy_Name" {
  type        = string
  default     = ""
  description = "Applicate Gateway Name"
  validation {
    condition     = length(var.appgtwy_Name) > 6 && can(regex("dev", lower(var.appgtwy_Name)))
    error_message = " The appgtwy_Name must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  }
}

variable "appgtwy_SKUName" {
  type        = string
  default     = ""
  description = "Type of SKU  to use for APP Gateway "
}
variable "appgtwy_SKUTier" {
  type        = string
  default     = ""
  description = "Type SKU Tier to use for APP Gateway"
}
variable "appgtwy_CapacityMin" {
  type        = number
  default     = 1
  description = "Minimum capacity "
}
variable "appgtwy_CapacityMax" {
  type        = number
  default     = 2
  description = "Max capacity"
}
variable "appgtwy_IdentityType" {
  type        = string
  default     = "userAssigned"
  description = "Identy to use for APP Gateway"

}
variable "appgtwy_IPConfig" {
  type        = string
  default     = ""
  description = "Gateway IP Configurations to use"
}
variable "location" {
  type        = string
  default     = "eastus2"
  description = "location for APP Gateway deployment"
  validation {
    condition     = contains(["eastus2", "centralus"], lower(var.location))
    error_message = "Unsupported Azure Region specified for APP Gateway. Only East US2 and Central US Azure Regions are supported."
  }
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}
variable "appgtwy_subnet_id" {
  type        = string
  default     = ""
  description = "APP Gateway to use subnet for front end, this will be allocated from module"
}