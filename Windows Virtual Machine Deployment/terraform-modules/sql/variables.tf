variable "sqlservername" {
  type        = string
  default     = ""
  description = "SQL Server name to be used."
  validation {
    condition     = length(var.sqlservername) < 63 && can(regex("^[a-z0-9-]*$", lower(var.sqlservername)))
    error_message = " The SQLServervName must be valid name, name can contain only lowercase letters, numbers, and '-', but can't start or end with '-' or have more than 63 characters."
  }
}

variable "location" {
  type        = string
  default     = "eastus2"
  description = "Location for SQL Server"
  validation {
    condition     = contains(["eastus2", "centralus"], lower(var.location))
    error_message = "Unsupported Azure Region specified for SQL Server. Only East US2 and Central US Azure Regions are supported."
  }
}
variable "rg_Name" {
  type        = string
  default     = ""
  description = "Resource group name to deploy the resources"
}

variable "sql_version" {
  type        = string
  default     = ""
  description = "SQL Server version to be used"
}
variable "sql_user" {
  type        = string
  default     = ""
  description = "SQL Server login username - This will be fetched from KV secrets."
}
variable "sql_password" {
  type        = string
  default     = ""
  description = "SQL Server login password - This will be fetched from KV secrets."
}

variable "mssqldb" {
  type        = string
  default     = ""
  description = "SQL Database name"
}
variable "mssql_serverid" {
  type        = string
  default     = ""
  description = "SQL Server id for the SQL server to be used "
}
variable "sql_collation" {
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
  description = "SQL database collation"
}
variable "sql_db_max_size" {
  type        = number
  default     = 4
  description = "The max size of the database in gigabytes."
}
variable "sql_sku_name" {
  type        = string
  default     = "BC_Gen5_2"
  description = "Specifies the name of the SKU used by the database"
}
variable "short_term_ret_days" {
  type        = number
  default     = 15
  description = "Point In Time Restore configuration. Value has to be between 7 and 35."
}
variable "weekly_retention" {
  type        = string
  default     = ""
  description = "The weekly retention policy for an LTR backup. Valid value is between 1 to 520 weeks. e.g. P1Y, P1M, P1W or P7D."
}
variable "monthly_retention" {
  type        = string
  default     = ""
  description = "The monthly retention policy for an LTR backup. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D."
}
variable "yearly_retention" {
  type        = string
  default     = ""
  description = "The yearly retention policy for an LTR backup. Valid value is between 1 to 10 years. e.g. P1Y, P12M, P52W or P365D."
}

variable "week_of_year" {
  type        = number
  description = "The week of year to take the yearly backup. Value has to be between 1 and 52."
}

variable "sql_license_type" {
  type        = string
  default     = "LicenseIncluded"
  description = "Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice."
}