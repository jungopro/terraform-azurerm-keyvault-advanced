output "key-vault-id" {
  description = "Key Vault ID"
  value       = azurerm_key_vault.key_vault.id
}

output "key-vault-url" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.key_vault.vault_uri
}

output "secrets" {
  value = values(azurerm_key_vault_secret.secret).*.value
}
