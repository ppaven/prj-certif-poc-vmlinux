module "uploadcertif" {
  source = "../../modules/upload-certif/"

  aaa_subs_id        = var.subscription_id
  aaa_rgp            = "AZC-POC-RG-CERT"
  aaa_name           = "azc-poc-cert-aaa"
  certificate_name   = module.cert_vm.certificate_name
  domain_name        = "webvm.${var.zone_name}"
  subscription_all   = data.azurerm_subscription.subs.display_name
  resource_group_all = azurerm_resource_group.rg.name
  resource_type_all  = "VM"
  resources_all      = module.vm.name
  keyvault_all       = lower("${module.naming.key_vault.name}01")

}