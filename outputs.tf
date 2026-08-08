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

# The registry is count-gated on the SKU: acr_premium exists only for Premium and
# acr_standard_basic only for the others, so every existing login-server output is
# a splat that is empty for one of the two paths. A DAG capability cannot pick
# between them, which is why "acr_login_server" pointed at a "login_server" output
# that never existed. This is that output: whichever registry the SKU actually
# created.
output "login_server" {
  description = "Login server of the registry created for the selected SKU."
  value = try(coalesce(
    one(azurerm_container_registry.acr_premium[*].login_server),
    one(azurerm_container_registry.acr_standard_basic[*].login_server),
  ), null)
}
