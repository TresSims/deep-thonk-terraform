resource "vault_identity_oidc_key" "main" {
  name = "oidc-key"
  allowed_client_ids = ["*"]
  rotation_period = 3600
  verification_ttl  = 3600
}

resource "vault_identity_oidc_assignment" "main" {
  name = "oidc-assignment"
  entity_ids = ["*"]
  group_ids = ["*"]
}

resource "vault_identity_oidc_client" "sims_family_oidc" {
  name = "sims-family-oidc"
  key = vault_identity_oidc_key.main
  redirect_uris = []
  assignments = [
    vault_identity_oidc_assignment.main
  ]
  id_token_ttl = 2400
  access_token_ttl = 7200
}

resource "vault_identity_oidc_scope" "sims_family_oidc_scope_groups" {
  name = "groups"
  template = jsonencode(
  {
    groups = "{{identity.entity.groups.names}}",
  }
  )
  description = "Groups scope."
}

resource "vault_identity_oidc_provider" "sims_family_oidc" {
  name = "sims-family-oidc"
  https_enabled = true
  issuer_host = "vault.k8s.deep-thonk.com/"
  allowed_client_ids = [
    vault_identity_oidc_client.sims_family_oidc.client
  ]
  scopes_supported = [
    vault_identity_oidc_scope.sims_family_oidc_scope_groups.name
  ]
}
