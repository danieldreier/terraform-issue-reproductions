output "app_service_name" {
  value =  {
    for instance in azurerm_app_service.main:
    instance.location => instance.name...
  } #length(azurerm_app_service.main) > 0 ? "https://${azurerm_app_service.main[0].name}" : ""
}

output "app_service_default_hostname" {
  value =  {
    for instance in azurerm_app_service.main:
    instance.location => instance.default_site_hostname...
  } 
  #value = length(azurerm_app_service.main) > 0 ? "https://${azurerm_app_service.main[0].default_site_hostname}" : ""
}