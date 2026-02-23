#############
# ROOT CERT #
#############
resource "vault_mount" "pki" {
  path        = "pki"
  type        = "pki"
  description = "Vault root pki mount"

  default_lease_ttl_seconds   = 86400
  max_lease_ttl_seconds       = 315360000
}

resource "vault_pki_secret_backend_root_cert" "root_2026" {
  backend     = vault_mount.pki.path
  type        = "internal"
  common_name = "deep-thonk.com"
  ttl         = 315360000
  issuer_name = "deep-thonk-root-2026"
}

resource "vault_pki_secret_backend_issuer" "root_2026" {
  backend                        = vault_mount.pki.path
  issuer_ref                     = vault_pki_secret_backend_root_cert.root_2026.issuer_id
  issuer_name                    = vault_pki_secret_backend_root_cert.root_2026.issuer_name
  revocation_signature_algorithm = "SHA256WithRSA"
}

resource "vault_pki_secret_backend_role" "role" {
  backend          = vault_mount.pki.path
  name             = "2026-servers"
  ttl              = 86400
  allow_ip_sans    = true
  key_type         = "rsa"
  key_bits         = 4096
  allowed_domains  = ["deep-thonk.com", "sims.family"]
  allow_subdomains = true
  allow_any_name   = true
}

resource "vault_pki_secret_backend_config_urls" "pki-config-urls" {
  backend                 = vault_mount.pki.path
  issuing_certificates    = ["http://localhost:8200/v1/pki/ca"]
  crl_distribution_points = ["http://localhost:8200/v1/pki/crl"]
  ocsp_servers            = ["http://localhost:8200/v1/pki/ocsp"]
  enable_templating       = true
}

##############
# INTER CERT #
##############
resource "vault_mount" "pki_int" {
  path        = "pki-int"
  type        = "pki"
  description = "Vault signing pki mount"

  default_lease_ttl_seconds   = 86400
  max_lease_ttl_seconds       = 315360000
}

resource "vault_pki_secret_backend_intermediate_cert_request" "csr-request" {
   backend     = vault_mount.pki_int.path
   type        = "internal"
   common_name = "deep-thonk.com Intermediate Authority"
}

resource "vault_pki_secret_backend_root_sign_intermediate" "intermediate" {
   backend     = vault_mount.pki.path
   common_name = "new_intermediate"
   csr         = vault_pki_secret_backend_intermediate_cert_request.csr-request.csr
   format      = "pem_bundle"
   ttl         = 15480000
   issuer_ref  = vault_pki_secret_backend_root_cert.root_2026.issuer_id
}
