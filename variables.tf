variable "azure_adls_gen2_mounts" {
  description = <<EOT
Map of azure_adls_gen2_mounts, attributes below
Required:
    - client_id
    - client_secret_key
    - client_secret_scope
    - container_name
    - initialize_file_system
    - mount_name
    - storage_account_name
    - tenant_id
Optional:
    - cluster_id
    - directory
    - environment
EOT

  type = map(object({
    client_id              = string
    client_secret_key      = string
    client_secret_scope    = string
    container_name         = string
    initialize_file_system = bool
    mount_name             = string
    storage_account_name   = string
    tenant_id              = string
    cluster_id             = optional(string)
    directory              = optional(string)
    environment            = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.azure_adls_gen2_mounts : (
        v.environment == null || (contains(["PUBLIC", "USGOVERNMENT", "CHINA"], v.environment))
      )
    ])
    error_message = "must be one of: \"PUBLIC\", \"USGOVERNMENT\", \"CHINA\""
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

