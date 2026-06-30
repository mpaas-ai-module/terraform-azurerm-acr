# Auto-generated producer outputs for DAG wiring (mpaas-ai-module migration).
# Exposes id / name / connection attributes other resources consume.

output "acr_premium_id" {
  value = azurerm_container_registry.acr_premium[*].id
}
output "acr_premium_name" {
  value = azurerm_container_registry.acr_premium[*].name
}
output "acr_premium_login_server" {
  value = azurerm_container_registry.acr_premium[*].login_server
}
output "acr_premium_admin_username" {
  value     = azurerm_container_registry.acr_premium[*].admin_username
  sensitive = true
}
output "acr_premium_admin_password" {
  value     = azurerm_container_registry.acr_premium[*].admin_password
  sensitive = true
}
output "acr_standard_basic_id" {
  value = azurerm_container_registry.acr_standard_basic[*].id
}
output "acr_standard_basic_name" {
  value = azurerm_container_registry.acr_standard_basic[*].name
}
output "acr_standard_basic_login_server" {
  value = azurerm_container_registry.acr_standard_basic[*].login_server
}
output "acr_standard_basic_admin_username" {
  value     = azurerm_container_registry.acr_standard_basic[*].admin_username
  sensitive = true
}
output "acr_standard_basic_admin_password" {
  value     = azurerm_container_registry.acr_standard_basic[*].admin_password
  sensitive = true
}
