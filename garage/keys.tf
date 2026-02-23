resource "garage_key" "observability_key" {
        name = "observability"
}

resource "vault_kv_secret_v2" "observability_key" {
  name = "o11y/observability_key"
  mount = "kubernetes"
  data_json =  jsonencode(
    {
      secret_key = garage_key.observability_key.secret_access_key
      access_key = garage_key.observability_key.id
    }
  )
}
