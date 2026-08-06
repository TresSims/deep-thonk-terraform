resource "tailscale_dns_configuration" "dns_config" {
  magic_dns = true

  nameservers {
    address            = "1.1.1.1"
    use_with_exit_node = false
  }
}
