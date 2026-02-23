terraform {
  required_providers {
    garage = {
      source = "jkossis/garage"
      version = ">= 1.0.4"
    }

    vault = {
      source  = "hashicorp/vault"
      version = ">= 5.4.0"
    }
  }
}
