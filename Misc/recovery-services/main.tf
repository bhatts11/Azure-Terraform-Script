
resource "azurerm_recovery_services_vault" "rsv_name" {
  name                = var.rsv_name
  location            = var.location
  resource_group_name = var.rg_Name
  sku                 = var.rsv_sku
}

resource "azurerm_backup_policy_vm" "rsv_vm_policy" {
  name                = var.rsv_vm_policy
  resource_group_name = var.rg_Name
  recovery_vault_name = azurerm_recovery_services_vault.rsv_name.name
  timezone            = var.backup_timezone

  backup {
    frequency = "Weekly"
    time      = "23:00"
    weekdays  = ["Monday", "Wednesday"]
  }

  retention_weekly {
    weekdays = ["Monday", "Wednesday"]
    count    = 52
  }

  retention_monthly {
    weeks    = ["First", "Second"]
    weekdays = ["Monday", "Wednesday"]
    count    = 100
  }

  retention_yearly {
    months   = ["July"]
    weeks    = ["First", "Second"]
    weekdays = ["Monday", "Wednesday"]
    count    = 100
  }
}