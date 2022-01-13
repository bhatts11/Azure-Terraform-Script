## LAW
resource "azurerm_log_analytics_workspace" "log_analytics_workspce" {
    name                = var.AKS_LAWName
    location            = var.location
    resource_group_name = var.rg_Name
    sku                 = var.AKS_LAWSKU
}

resource "azurerm_log_analytics_solution" "law_solution" {
    solution_name         = "ContainerInsights"
    location              = var.location 
    resource_group_name   = var.rg_Name 
    workspace_resource_id = azurerm_log_analytics_workspace.log_analytics_workspce.id
    workspace_name        = azurerm_log_analytics_workspace.log_analytics_workspce.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}

## AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
    name                    = var.AKS_ClusterName
    location                = var.location
    resource_group_name     = var.rg_Name
    dns_prefix              = var.AKS_DNSPrefix
    kubernetes_version      = var.AKS_Version
    private_cluster_enabled = var.AKS_PrivateClusterEnabled
    
    default_node_pool {
        name            = var.AKS_NodePoolName
        node_count      = var.AKS_NodeCount
        vm_size         = var.AKS_NodeVmSize
        os_disk_size_gb = var.AKS_NodeVmOSDiskSize
        max_pods        = var.AKS_MaxPodsPerNode
        vnet_subnet_id  = var.aks_subnet_id 
    }
    
    identity {
    type = "SystemAssigned"
    }
    
    # service_principal {
    #     client_id     = var.AKS_SPClientID
    #     client_secret = var.AKS_ClientSecret
    # }
    
    role_based_access_control {
        enabled = true
    }
    
    addon_profile {
        oms_agent {
        enabled                    = true
        log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_workspce.id
        }

        kube_dashboard {
          enabled = var.AKS_EnableKubeDashboard
        }
    }
    network_profile {
        load_balancer_sku = var.AKS_LoadBalancerSKU
        network_plugin    = var.AKS_NetworkPlugin
        #docker_bridge_cidr = "170.10.1.0/24"
    }
}