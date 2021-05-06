terraform {
  backend "azurerm" {
    storage_account_name = "actfstate"
    container_name       = "ac-iac-platform-on-premises"
    key                  = "terraform-remote-state"
  }
  required_version = ">= 0.12"
}

provider azurerm {
  subscription_id = "c6d6b051-f122-44dc-ba45-6b2331c1e8ee"
  version         = "=1.39.0"
}

provider azuread {
  subscription_id = "c6d6b051-f122-44dc-ba45-6b2331c1e8ee"
  tenant_id       = "6980564e-41fc-4d17-b94a-c150b0b0125e"
  version         = "=0.7.0"
}

locals {
  common-tags = {
    Terraform = "true"
  }
}

data azuread_group "platform-ops" {
  name = "SG-DPD-AZURE-PLATFORM-OPS"
}

data azurerm_resource_group "terraform-remote-state" {
  name     = "terraform-remote-state"
}

data azurerm_storage_account "actfstate" {
  name                      = "actfstate"
  resource_group_name       = data.azurerm_resource_group.terraform-remote-state.name
}
