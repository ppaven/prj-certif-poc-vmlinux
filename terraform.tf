terraform {
  backend "azurerm" {
    storage_account_name = "azcinfratfback"
    container_name       = "tfstate"
    key                  = "poc.vml.cert.tfstate"
  }
}
