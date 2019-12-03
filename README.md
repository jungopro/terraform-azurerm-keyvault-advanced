# terraform-azurerm-keyvault-advanced

[![Build Status](https://dev.azure.com/jungodevops/Terraform/_apis/build/status/jungopro.terraform-azurerm-keyvault-advanced?branchName=master)](https://dev.azure.com/jungodevops/Terraform/_build/latest?definitionId=27&branchName=master)

## Create Key Vault in Azure and (optionally) add policies and secrets

This Terraform module deploys a Key Vautl to Azure with a access policies and secrets passed as inputs
This module also has the option to create a Resource Group for the Key Vault, althought I recommend creating it manually since destruction of the Resource Group with `terraform destroy` can potientially cause destruction of other resources in the Resource Group beside the Key Vault

## Usage

```hcl
module "keyvault" {
  source              = "jungopro/keyvault-advanced/azurerm"
  resource_group_name = "myKeyVaultResourceGroup"
  location            = "westeurope"

  tags = {
    environment = "dev"
  }
}
```

## Example with multiple policies and secrets

```hcl
module "keyvault" {
  source              = "jungopro/keyvault-advanced/azurerm"
  resource_group_name = "myKeyVaultResourceGroup"
  location            = "westeurope"

  tags = {
    environment = "dev"
  }

  policies = {
    full = {
      tenant_id = "<ADD-TENANT-ID"
      object_id = "<ADD-OBJECT-ID>"
      key_permissions = [
        "backup",
        "create",
        "decrypt",
        "delete",
        "encrypt",
        "get",
        "import",
        "list",
        "purge",
        "recover",
        "restore",
        "sign",
        "unwrapKey",
        "update",
        "verify",
        "wrapKey",
      ]
      secret_permissions = [
        "backup",
        "delete",
        "get",
        "list",
        "purge",
        "recover",
        "restore",
        "set",
      ]
      certificate_permissions = [
        "create",
        "delete",
        "deleteissuers",
        "get",
        "getissuers",
        "import",
        "list",
        "listissuers",
        "managecontacts",
        "manageissuers",
        "purge",
        "recover",
        "setissuers",
        "update",
        "backup",
        "restore",
      ]
    }
    read = {
      tenant_id = "<ADD-TENANT-ID"
      object_id = "<ADD-OBJECT-ID>"
      key_permissions = [
        "get",
        "list",
      ]
      secret_permissions = [
        "get",
        "list",
      ]
      certificate_permissions = [
        "get",
        "getissuers",
        "list",
        "listissuers",
      ]
    }
  }

  secrets = {
    foo = {
      value = "" # setting to "" will auto generate a random value
    }
    bar = {
      value = "mysecretvalue" #
    }
  }
}
```

## Authors

Originally created by [Omer Barel](https://github.com/jungopro)

## License

MIT
