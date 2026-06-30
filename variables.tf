variable "acr_name" {
  type        = string
  description = "Name of the Azure Container Registry"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "sku" {
  type        = string
  description = "ACR SKU tier"
  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "SKU must be Basic, Standard, or Premium."
  }
}

variable "admin_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether the admin user is enabled for the ACR."
}

variable "public_network_access_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether public network access is allowed for the ACR."
}

variable "anonymous_pull_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether anonymous (unauthenticated) pull access is allowed."
}

variable "zone_redundancy_enabled" {
  type        = bool
  default     = false
  description = "Enables zone redundancy for the ACR (available only for Premium SKU)."
}

variable "data_endpoint_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether the dedicated data endpoint is enabled (Premium SKU only)."
}

variable "export_policy_enabled" {
  type        = bool
  default     = true
  description = "Specifies whether the export policy is enabled (Premium SKU only)."
}

variable "quarantine_policy_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether the quarantine policy is enabled (Premium SKU only)."
}

variable "network_rule_bypass_option" {
  type        = string
  default     = "AzureServices"
  description = "Specifies which traffic can bypass the ACR network rules (e.g., AzureServices, None)."
}

variable "acr_default_action" {
  type        = string
  default     = "Allow"
  description = "Specifies the default action of the network rules (Allow or Deny)."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the ACR resource."
}

variable "retention_policy_in_days" {
  type        = number
  default     = 7
  description = "Number of days to retain untagged manifests before deletion."
}

variable "trust_policy_enabled" {
  type        = bool
  default     = false
  description = "Enables content trust policy for image signing verification."
}

variable "identity_type" {
  type        = string
  default     = "SystemAssigned"
  description = "Specifies the type of managed identity to associate with the ACR (SystemAssigned or UserAssigned)."
}
