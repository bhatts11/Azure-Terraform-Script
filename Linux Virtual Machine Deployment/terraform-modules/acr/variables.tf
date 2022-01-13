variable "acr_Name" {
  type        = string
  default     = ""
  description = "Name of the continer registery to create"
  validation {
    #condition    = length(var.acr_Name) > 6 && substr(var.acr_Name, 0, 3) == "dev" 
    condition     = length(var.acr_Name) > 6 && can(regex("dev", lower(var.acr_Name)))
    error_message = " The acr_Name must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "acr_SKU" {
  type        = string
  default     = "Premium"
  description = "SKU name to use for ACR => Basic, Standard or Premium"
}
variable "location" {
  type        = string
  default     = "eastus2"
  description = "name of the location"
  validation {
    condition     = contains(["eastus2", "centralus"], lower(var.location))
    error_message = "Unsupported Azure Region specified in acr. Only East US2 and Central US Azure Regions are supported."
  }
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}