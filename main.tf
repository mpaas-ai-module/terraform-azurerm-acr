resource "azurerm_container_registry" "acr_premium" {
  count                         = var.sku == "Premium" ? 1 : 0
  name                          = var.acr_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  tags                          = var.tags
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  data_endpoint_enabled         = var.data_endpoint_enabled
  export_policy_enabled         = var.export_policy_enabled
  zone_redundancy_enabled       = var.zone_redundancy_enabled
  quarantine_policy_enabled     = var.quarantine_policy_enabled
  network_rule_bypass_option    = var.network_rule_bypass_option


  network_rule_set {
    default_action = var.acr_default_action
  }

  identity {
    # identity_ids = []
    # principal_id = null
    # tenant_id = null
    type = "SystemAssigned"
  }
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
  # encryption                    = [ 
  #   {
  #   enabled            = var.encryption.enabled
  #   key_vault_key_id   = var.encryption.key_vault_key_id
  #   identity_client_id = var.encryption.identity_client_id
  # }
  # ]
}

resource "azurerm_container_registry" "acr_standard_basic" {
  count                         = var.sku != "Premium" ? 1 : 0
  name                          = var.acr_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  anonymous_pull_enabled        = var.anonymous_pull_enabled
  data_endpoint_enabled         = var.data_endpoint_enabled
  export_policy_enabled         = var.export_policy_enabled
  zone_redundancy_enabled       = var.zone_redundancy_enabled
  quarantine_policy_enabled     = var.quarantine_policy_enabled
  network_rule_bypass_option    = var.network_rule_bypass_option
  tags                          = var.tags
  identity {
    type = "SystemAssigned"
  }
  lifecycle {
    ignore_changes = [tags]
  }
}
