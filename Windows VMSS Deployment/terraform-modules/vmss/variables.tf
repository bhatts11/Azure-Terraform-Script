variable "vmss_pip_prefix" {
  type        = string
  default     = ""
  description = "Public IP Prefix for VMSS"
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource Group to be used for Virtual Machine Deployment"
}
variable "location" {
  type        = string
  default     = ""
  description = "Location of the Azure Virtual Machine"
}

# variable "pip_allocation" {
#   type    = string
#   default = ""
#   validation {
#     condition     = contains(["static", "dynamic"], lower(var.pip_allocation))
#     error_message = "Public IP assignment can be either Static or Dynamic. Please correct your selection."
#   }
#   description = "Public IP assignment type"
# }
variable "vmss_name" {
  type        = string
  default     = ""
  description = "Virtual Machine Scale Set name."
}


variable "vmss_sku" {
  type        = string
  default     = ""
  description = "Virtual Machine Scale Set SKU. This can be Virtual Machine series, i.e. Standard_F2, Standard_B2s etc."
}

variable "vmss_instance" {
  type        = number
  description = "Number of instances in Virtual Machine Scale Set."
}
variable "vmss_user" {
  type        = string
  default     = ""
  description = "Virtual Machine Scale Set User name."
}
variable "vmss_password" {
  type        = string
  default     = ""
  description = "Password for Virtual Machine Scale Set."
}
variable "prefix" {
  type        = string
  default     = ""
  description = "Computer Name prefix for Virtual Machine Scale Set."
}

variable "vmss_zones" {
  type        = list(any)
  default     = [1, 2, 3]
  description = "A list of Availability Zones in which the Virtual Machines in this Scale Set should be created in."
}
variable "vmss_image_publisher" {
  type        = string
  default     = ""
  description = "Specifies the publisher of the image. Changing this forces a new resource to be created."
}
variable "vmss_image_offer" {
  type        = string
  default     = ""
  description = "Specifies the offer of the image used to create the virtual machines."
}
variable "vmss_image_sku" {
  type        = string
  default     = ""
  description = "Specifies the SKU of the image used to create the virtual machines. "
}

variable "vmss_image_version" {
  type        = string
  default     = ""
  description = " Specifies the version of the image used to create the virtual machines."
}

variable "vmss_storage_acc_type" {
  type        = string
  default     = "Standard_LRS"
  description = "OS Disk Storage Type. Possible options are Standard_LRS, StandardSSD_LRS and Premium_LRS."
  validation {
    condition     = contains(["Standard_LRS", "StandardSSD_LRS", "Premium_LRS"], var.vmss_storage_acc_type)
    error_message = "Unsupported disk type for Virtual machine. Possible options are Standard_LRS, StandardSSD_LRS and Premium_LRS."
  }
}

variable "vmss_os_disk_caching" {
  type        = string
  default     = "ReadWrite"
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
  validation {
    condition     = contains(["None", "ReadOnly", "ReadWrite"], var.vmss_os_disk_caching)
    error_message = "Unsupported value for disk caching. Possible values are None, ReadOnly and ReadWrite."
  }

}
variable "vmss_auto_config" {
  type        = string
  description = "Azure Monitor Configuration to monitor Virtual Machine Scale Set metrics."
}

variable "vmss_def_count" {
  type        = number
  description = "Default number of nodes for Virtual Machine scale set."
}
variable "vmss_max_count" {
  type        = number
  description = "Maximum number of nodes for Virtual Machine scale set autoscaling configuration."
}
variable "vmss_min_count" {
  type        = number
  description = "Minimum number of nodes for Virtual Machine scale set autoscaling configuration."
}
variable "vmss_cpu_upper_threshold" {
  type        = number
  description = "Upper threshold for CPU usage percentage to autoscale VMSS."
}

variable "vmss_cpu_lower_threshold" {
  type        = number
  description = "Lower threshold for CPU usage percentage to autoscale VMSS."
}

variable "vmss_subnetid" {
  type        = string
  default     = ""
  description = "Subnet ID for Virtual machine scale set creation."
}