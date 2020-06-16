Reproduction case for: https://github.com/hashicorp/terraform/issues/24448

Status: unable to reproduce issue as stated

How to run:
```
terraform-v0.13.0-beta1 init
terraform-v0.13.0-beta1 plan --var-file=multiRegion.tfvars
```

Output using 0.12.23 exactly as reported:
```
bash-3.2$ terraform-v0.12.23 init
Initializing modules...

Initializing the backend...

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.azurerm: version = "~> 2.14"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
bash-3.2$ terraform-v0.12.23 plan --var-file=multiRegion.tfvars
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.appservice.azurerm_app_service.main["northcentralus"] will be created
  + resource "azurerm_app_service" "main" {
      + app_service_plan_id            = (known after apply)
      + app_settings                   = (known after apply)
      + client_affinity_enabled        = (known after apply)
      + default_site_hostname          = (known after apply)
      + enabled                        = true
      + https_only                     = false
      + id                             = (known after apply)
      + location                       = "northcentralus"
      + name                           = "north-northcentralus-appservice"
      + outbound_ip_addresses          = (known after apply)
      + possible_outbound_ip_addresses = (known after apply)
      + resource_group_name            = "rontest-bold-resources"
      + site_credential                = (known after apply)
      + source_control                 = (known after apply)

      + auth_settings {
          + additional_login_params        = (known after apply)
          + allowed_external_redirect_urls = (known after apply)
          + default_provider               = (known after apply)
          + enabled                        = (known after apply)
          + issuer                         = (known after apply)
          + runtime_version                = (known after apply)
          + token_refresh_extension_hours  = (known after apply)
          + token_store_enabled            = (known after apply)
          + unauthenticated_client_action  = (known after apply)

          + active_directory {
              + allowed_audiences = (known after apply)
              + client_id         = (known after apply)
              + client_secret     = (sensitive value)
            }

          + facebook {
              + app_id       = (known after apply)
              + app_secret   = (sensitive value)
              + oauth_scopes = (known after apply)
            }

          + google {
              + client_id     = (known after apply)
              + client_secret = (sensitive value)
              + oauth_scopes  = (known after apply)
            }

          + microsoft {
              + client_id     = (known after apply)
              + client_secret = (sensitive value)
              + oauth_scopes  = (known after apply)
            }                                                                                                                                      [188/1980]

          + twitter {
              + consumer_key    = (known after apply)
              + consumer_secret = (sensitive value)
            }
        }

      + connection_string {
          + name  = (known after apply)
          + type  = (known after apply)
          + value = (sensitive value)
        }

      + identity {
          + identity_ids = (known after apply)
          + principal_id = (known after apply)
          + tenant_id    = (known after apply)
          + type         = (known after apply)
        }

      + logs {
          + application_logs {
              + azure_blob_storage {
                  + level             = (known after apply)
                  + retention_in_days = (known after apply)
                  + sas_url           = (sensitive value)
                }
            }

          + http_logs {
              + azure_blob_storage {
                  + retention_in_days = (known after apply)
                  + sas_url           = (sensitive value)
                }

              + file_system {
                  + retention_in_days = (known after apply)
                  + retention_in_mb   = (known after apply)
                }
            }
        }

      + site_config {
          + always_on                = false
          + dotnet_framework_version = "v4.0"
          + ftps_state               = (known after apply)
          + http2_enabled            = false
          + ip_restriction           = (known after apply)
          + linux_fx_version         = (known after apply)
          + local_mysql_enabled      = (known after apply)
          + managed_pipeline_mode    = (known after apply)
          + min_tls_version          = (known after apply)
          + remote_debugging_enabled = false
          + remote_debugging_version = (known after apply)
          + scm_type                 = "None"
          + websockets_enabled       = (known after apply)
          + windows_fx_version       = (known after apply)

          + cors {
              + allowed_origins     = (known after apply)
              + support_credentials = (known after apply)
            }
        }

      + storage_account {
          + access_key   = (sensitive value)
          + account_name = (known after apply)
          + mount_path   = (known after apply)
          + name         = (known after apply)
          + share_name   = (known after apply)
          + type         = (known after apply)
        }
    }

  # module.appservice.azurerm_app_service.main["southcentralus"] will be created
  + resource "azurerm_app_service" "main" {
      + app_service_plan_id            = (known after apply)
      + app_settings                   = (known after apply)
      + client_affinity_enabled        = (known after apply)
      + default_site_hostname          = (known after apply)
      + enabled                        = true
      + https_only                     = false
      + id                             = (known after apply)
      + location                       = "southcentralus"
      + name                           = "south-southcentralus-appservice"
      + outbound_ip_addresses          = (known after apply)
      + possible_outbound_ip_addresses = (known after apply)
      + resource_group_name            = "rontest-bold-resources"
      + site_credential                = (known after apply)
      + source_control                 = (known after apply)

      + auth_settings {
          + additional_login_params        = (known after apply)
          + allowed_external_redirect_urls = (known after apply)
          + default_provider               = (known after apply)
          + enabled                        = (known after apply)
          + issuer                         = (known after apply)
          + runtime_version                = (known after apply)
          + token_refresh_extension_hours  = (known after apply)
          + token_store_enabled            = (known after apply)
          + unauthenticated_client_action  = (known after apply)

          + active_directory {
              + allowed_audiences = (known after apply)
              + client_id         = (known after apply)
              + client_secret     = (sensitive value)
            }

          + facebook {
              + app_id       = (known after apply)
              + app_secret   = (sensitive value)
              + oauth_scopes = (known after apply)
            }

          + google {
              + client_id     = (known after apply)
              + client_secret = (sensitive value)
              + oauth_scopes  = (known after apply)
            }

          + microsoft {
              + client_id     = (known after apply)
              + client_secret = (sensitive value)
              + oauth_scopes  = (known after apply)
            }
                                                                                                                                                    [62/1980]
          + twitter {
              + consumer_key    = (known after apply)
              + consumer_secret = (sensitive value)
            }
        }

      + connection_string {
          + name  = (known after apply)
          + type  = (known after apply)
          + value = (sensitive value)
        }

      + identity {
          + identity_ids = (known after apply)
          + principal_id = (known after apply)
          + tenant_id    = (known after apply)
          + type         = (known after apply)
        }

      + logs {
          + application_logs {
              + azure_blob_storage {
                  + level             = (known after apply)
                  + retention_in_days = (known after apply)
                  + sas_url           = (sensitive value)
                }
            }

          + http_logs {
              + azure_blob_storage {
                  + retention_in_days = (known after apply)
                  + sas_url           = (sensitive value)
                }

              + file_system {
                  + retention_in_days = (known after apply)
                  + retention_in_mb   = (known after apply)
                }
            }
        }

      + site_config {
          + always_on                = false
          + dotnet_framework_version = "v4.0"
          + ftps_state               = (known after apply)
          + http2_enabled            = false
          + ip_restriction           = (known after apply)
          + linux_fx_version         = (known after apply)
          + local_mysql_enabled      = (known after apply)
          + managed_pipeline_mode    = (known after apply)
          + min_tls_version          = (known after apply)
          + remote_debugging_enabled = false
          + remote_debugging_version = (known after apply)
          + scm_type                 = "None"
          + websockets_enabled       = (known after apply)
          + windows_fx_version       = (known after apply)

          + cors {
              + allowed_origins     = (known after apply)
              + support_credentials = (known after apply)
            }
        }

      + storage_account {
          + access_key   = (sensitive value)
          + account_name = (known after apply)
          + mount_path   = (known after apply)
          + name         = (known after apply)
          + share_name   = (known after apply)
          + type         = (known after apply)
        }
    }

  # module.appservice.azurerm_app_service_plan.main["northcentralus"] will be created
  + resource "azurerm_app_service_plan" "main" {
      + id                           = (known after apply)
      + kind                         = "Linux"
      + location                     = "northcentralus"
      + maximum_elastic_worker_count = (known after apply)
      + maximum_number_of_workers    = (known after apply)
      + name                         = "north-asp"
      + reserved                     = true
      + resource_group_name          = "rontest-bold-resources"

      + sku {
          + capacity = (known after apply)
          + size     = "S1"
          + tier     = "Standard"
        }
    }

  # module.appservice.azurerm_app_service_plan.main["southcentralus"] will be created
  + resource "azurerm_app_service_plan" "main" {
      + id                           = (known after apply)
      + kind                         = "Linux"
      + location                     = "southcentralus"
      + maximum_elastic_worker_count = (known after apply)
      + maximum_number_of_workers    = (known after apply)
      + name                         = "south-asp"
      + reserved                     = true
      + resource_group_name          = "rontest-bold-resources"

      + sku {
          + capacity = (known after apply)
          + size     = "S1"
          + tier     = "Standard"
        }
    }

  # module.appservice.azurerm_resource_group.main will be created
  + resource "azurerm_resource_group" "main" {
      + id       = (known after apply)
      + location = "northcentralus"
      + name     = "rontest-bold-resources"
    }

Plan: 5 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```
