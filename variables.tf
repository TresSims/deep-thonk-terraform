variable "technitium_server_url" {
  description = "server url for technitium"
  type        = string
}

variable "technitium_api_token" {
  description = "api token for accessing technitium"
  sensitive   = true
  ephemeral   = true
  type        = string
}
