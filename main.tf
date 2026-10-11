resource "databricks_azure_adls_gen2_mount" "azure_adls_gen2_mounts" {
  for_each = var.azure_adls_gen2_mounts

  client_id              = each.value.client_id
  client_secret_key      = each.value.client_secret_key
  client_secret_scope    = each.value.client_secret_scope
  container_name         = each.value.container_name
  initialize_file_system = each.value.initialize_file_system
  mount_name             = each.value.mount_name
  storage_account_name   = each.value.storage_account_name
  tenant_id              = each.value.tenant_id
  cluster_id             = each.value.cluster_id
  directory              = each.value.directory
  environment            = each.value.environment
}

