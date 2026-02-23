variable "garage_api_key" {
  description = "api key for accessing garage"
  sensitive = true
  ephemeral = true
  type = string
}
