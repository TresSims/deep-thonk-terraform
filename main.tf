module "vault" {
  source = "./vault"
}

module "kubernetes" {
  source = "./kubernetes"
  
  kubernetes_mount = module.vault.kubernetes_mount
}
