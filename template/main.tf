module "{{.name}}" {                     
     source               = "bootlabstech/acr/azurerm"
     version              = "1.0.14"
     resource_group_name  = "${var.resource_group_name}"
     location             = "${var.resource_group_location}"
     sku                  = var.{{.name}}_sku
     acr_name                 = var.{{.name}}_name
}