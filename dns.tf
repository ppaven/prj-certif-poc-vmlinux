locals {
  dns_rg_name = "${var.company_trig}-${var.env}-RG-DNS"
}

data "azurerm_dns_zone" "pub_zone" {
  name                = var.zone_name
  resource_group_name = local.dns_rg_name
}