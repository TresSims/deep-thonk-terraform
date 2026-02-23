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

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 3.0.1"
    }
  }
}

provider "garage" {
  endpoint = "https://garage.deep-thonk.com"
  token = var.garage_api_key
}

provider "vault" {
  address = "https://vault.k8s.deep-thonk.com"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "k8s"
}
