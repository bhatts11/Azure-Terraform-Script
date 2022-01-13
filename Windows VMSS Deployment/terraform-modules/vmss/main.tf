
resource "azurerm_public_ip_prefix" "vmss_pip_prefix" {
  name                = var.vmss_pip_prefix
  location            = var.location
  resource_group_name = var.rg_Name
}

resource "azurerm_windows_virtual_machine_scale_set" "vmss" {
  name                 = var.vmss_name
  resource_group_name  = var.rg_Name
  location             = var.location
  sku                  = var.vmss_sku
  instances            = var.vmss_instance
  admin_username       = var.vmss_user
  admin_password       = var.vmss_password
  computer_name_prefix = var.prefix
  zones                = var.vmss_zones
  zone_balance         = true

  source_image_reference {
    publisher = var.vmss_image_publisher
    offer     = var.vmss_image_offer
    sku       = var.vmss_image_sku
    version   = var.vmss_image_version
  }

  network_interface {
    name    = "primary"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.vmss_subnetid
    }
  }

  network_interface {
    name = "secondary"

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.vmss_subnetid

      public_ip_address {
        name                = "first"
        public_ip_prefix_id = azurerm_public_ip_prefix.vmss_pip_prefix.id
      }

    }
  }

  os_disk {
    storage_account_type = var.vmss_storage_acc_type
    caching              = var.vmss_os_disk_caching
  }

  data_disk {
    storage_account_type = var.storage_acc_type
    caching              = var.vmss_os_disk_caching
    disk_size_gb         = 10
    lun                  = 10
  }

  # Since these can change via auto-scaling outside of Terraform,
  # let's ignore any changes to the number of instances
  lifecycle {
    ignore_changes = ["instances"]
  }

  # extension {
  #   name                       = "CustomScript"
  #   publisher                  = "Microsoft.Compute"
  #   type                       = "CustomScriptExtension"
  #   type_handler_version       = "1.10"
  #   auto_upgrade_minor_version = true

  #   settings = jsonencode({ "commandToExecute" = "powershell.exe -c \"Get-Content env:computername\"" })

  #   protected_settings = jsonencode({ "managedIdentity" = {} })
  # }

  # extension {
  #   name                       = "AADLoginForWindows"
  #   publisher                  = "Microsoft.Azure.ActiveDirectory"
  #   type                       = "AADLoginForWindows"
  #   type_handler_version       = "1.0"
  #   auto_upgrade_minor_version = true
  # }

}

resource "azurerm_monitor_autoscale_setting" "vmss_auto_config" {
  name                = var.vmss_auto_config
  resource_group_name = var.rg_Name
  location            = var.location
  target_resource_id  = azurerm_windows_virtual_machine_scale_set.vmss.id

  profile {
    name = "AutoScale"

    capacity {
      default = var.vmss_def_count
      minimum = var.vmss_max_count
      maximum = var.vmss_min_count
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = var.vmss_cpu_upper_threshold
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_windows_virtual_machine_scale_set.vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = var.vmss_cpu_lower_threshold
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}