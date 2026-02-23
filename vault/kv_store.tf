resource "vault_mount" "chezmoi" {
  path        = "chezmoi"
  type        = "kv"
  options     = { version = "2" }
  description = "A secrets mount for chezmoi"
}

resource "vault_kv_secret_backend_v2" "chezmoi" {
  mount        = vault_mount.chezmoi.path
  max_versions = 5
  cas_required = false
}

resource "vault_mount" "terraform" {
  path        = "terraform"
  type        = "kv"
  options     = { version = "2" }
  description = "A secrets mount for terraform"
}

resource "vault_kv_secret_backend_v2" "terraform" {
  mount        = vault_mount.terraform.path
  max_versions = 5
  cas_required = false
}

resource "vault_mount" "kubernetes" {
  path        = "kubernetes"
  type        = "kv"
  options     = { version = "2" }
  description = "A secrets mount for kubernetes"
}

resource "vault_kv_secret_backend_v2" "kubernetes" {
  mount        = vault_mount.kubernetes.path
  max_versions = 5
  cas_required = false
}

output "kubernetes_mount" {
  value = vault_mount.kubernetes.path
}

output "terraform_mount" {
  value = vault_mount.terraform.path
}
