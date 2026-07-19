terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 5.4.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 3.0.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }

    technitium = {
      source  = "registry.terraform.io/bartei/technitium"
      version = "1.0.1"
    }
  }
}

provider "vault" {
  address = "https://vault.k8s.deep-thonk.com"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k8s"
}

provider "random" {
}

provider "technitium" {
  server_url = var.technitium_server_url
  api_token  = var.technitium_api_token
}
