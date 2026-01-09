locals {
  location = "westeurope"
  project = "tfstack-testing"
}

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "dev" {
    inputs = {
        identity_token = identity_token.azurerm.jwt
        # client_id = ""
        subscription_id = "c842c56f-30ba-4e69-9cb1-338e4a1d0b1f"
        tenant_id = "cb934f1e-2f3c-4379-9765-82e86239f036"

        location = local.location
        prefix = "tfstack"
        suffix = "644547"
        cidr_range = "10.0.0.0/16"
        subnets = {
            subnet1 = ["10.0.0.0/24"]
        }
        tags = {
            environment = "dev"
            project = local.project
        }
    }
}