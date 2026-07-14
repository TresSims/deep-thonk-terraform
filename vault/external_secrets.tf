locals {
  namespaces = toset(["o11y", "media-server"])
}

resource "vault_policy" "external_secrets" {
  for_each = local.namespaces
  name = "external_secrets_${each.key}"
  
  policy = <<EOT
path "kubernetes/data/${each.key}/+" {
  capabilities = [ "create", "read", "update", "list" ]
}
path "kubernetes/metadata/${each.key}/+" {
  capabilities = [ "create", "read", "update", "list" ]
}
EOT
}

resource "vault_approle_auth_backend_role" "external_secrets" {
  for_each = local.namespaces
  
  backend        = vault_auth_backend.approle.path
  role_name      = vault_policy.external_secrets[each.key].name
  token_policies = ["external_secrets_${each.key}"]
}

resource "vault_approle_auth_backend_role_secret_id" "external_secrets_secret" {
  for_each = local.namespaces

  backend = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.external_secrets[each.key].role_name
}

resource "kubernetes_secret_v1" "approle_creds" {
  for_each = local.namespaces

  metadata {
    name = "approle-creds"
    namespace = "${each.key}"
  }

  data = {
    vault-role-id = vault_approle_auth_backend_role.external_secrets[each.key].role_id
    vault-role-secret = vault_approle_auth_backend_role_secret_id.external_secrets_secret[each.key].secret_id
  }
}
