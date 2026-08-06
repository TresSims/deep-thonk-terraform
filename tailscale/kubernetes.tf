resource "tailscale_oauth_client" "tres_sims_com_cluster_operator_client" {
  description = "tres-sims-com cluster operator credential"
  scopes      = ["auth_keys", "devices:core", "services"]
  tags        = ["tag:k8s-operator"]
}

resource "tailscale_oauth_client" "k8s_deep_thonk_cluster_operator_client" {
  description = "deep-thonk operator"
  scopes      = ["auth_keys", "devices:core", "services"]
  tags        = ["tag:k8s-operator"]
}
