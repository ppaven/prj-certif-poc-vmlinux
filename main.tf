provider "azurerm" {
  subscription_id                 = var.subscription_id
  # resource_provider_registrations = "core"
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

data "azurerm_client_config" "current" {}

data "azurerm_subscription" "subs" {
  subscription_id = var.subscription_id
}

locals {
  resource_group_name = "${var.company_trig}-${var.env}-RG-${var.service_name}"
}

#
#  https://github.com/Azure/terraform-azurerm-naming/tree/master
module "naming" {
  source  = "Azure/naming/azurerm"

  prefix                 = ["${var.company_trig}", "${var.env}"]  #  Trig Compagny, Env
  suffix                 = ["${var.service_name}"]                # Service_Name or Project
  unique-length          = 4                                      # = default
}

resource "azurerm_resource_group" "rg" {
  # name     = local.resource_group_name
  name       = upper(module.naming.resource_group.name)
  location   = var.location

  tags = module.tags.datamap
}


