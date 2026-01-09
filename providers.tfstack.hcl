required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~>3.0"
  }
  tls = {
    source  = "hashicorp/tls"
    version = "~>4.0"
  }
  random = {
    source  = "hashicorp/random"
    version = "~>3.0"
  }
  modtm = {
    source = "azure/modtm"
    version = "~>0.3"
  }
}

provider "azurerm" "this" {
  config {
    features {}

    use_cli = false

    use_oidc = true
    oidc_token = var.identity_token
    # client_id = var.client_id
    subscription_id = var.subscription_id
    tenant_id = var.tenant_id
  }
}

provider "tls" "this" {}
provider "random" "this" {}
provider "modtm" "this" {}