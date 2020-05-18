Reproduction case for https://github.com/hashicorp/terraform/issues/24951

Current status: unable to validate reproduction case due to the following error

```
Error: Unsupported argument

  on 24951.tf line 5, in module "managed_disk":
   5:   resource_group = azurerm_resource_group.main

An argument named "resource_group" is not expected here.
```
