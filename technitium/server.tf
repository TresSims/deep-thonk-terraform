resource "technitium_server_settings" "main" {
  log_queries = true

  enable_blocking = true
  block_list_urls = local.block_list_urls
}
