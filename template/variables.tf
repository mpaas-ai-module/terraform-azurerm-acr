# container registry
variable "{{.name}}_sku" {
     type = string
     description = "The SKU name of the container registry. Possible values are Basic, Standard and Premium."
}
variable "{{.name}}_name" {
     type = string
     description = "Specifies the name of the Container Registry. Only Alphanumeric characters allowed."
}