module "cert_vm" {
  source = "../../modules/create-certif/"

  aaa_subs_id        = var.subscription_id
  aaa_rgp            = "AZC-POC-RG-CERT"
  aaa_name           = "azc-poc-cert-aaa"
  domain_names       = "webvm.${var.zone_name}"
  dns_subscription   = data.azurerm_subscription.subs.display_name
  dns_resource_group = local.dns_rg_name
  dns_zone           = var.zone_name
  subscription       = data.azurerm_subscription.subs.display_name
  resource_group     = azurerm_resource_group.rg.name
  resource_type      = "VM"
  resources          = module.vm.name
  keyvault           = lower("${module.naming.key_vault.name}01")
}
