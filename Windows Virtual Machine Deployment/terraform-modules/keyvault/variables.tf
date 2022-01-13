variable "keyvalut_Name" {
  type        = string
  default     = ""
  description = "Name of the kev-vault to crrate"
  validation {
    condition     = length(var.keyvalut_Name) > 6 && can(regex("dev", lower(var.keyvalut_Name)))
    error_message = " The keyvalut_Name must be valied name, should contain \" dev \". This can be configured in variables.tf file to streamline according to the environment."
  }
}
variable "keyvalut_SKU" {
  type        = string
  default     = "standard"
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium"
}
variable "location" {
  type        = string
  default     = "eastus2"
  description = "location for key-valut deployment"
  validation {
    condition     = contains(["eastus2", "centralus"], lower(var.location))
    error_message = "Unsupported Azure Region specified for key-vault. Only East US2 and Central US Azure Regions are supported."
  }
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}