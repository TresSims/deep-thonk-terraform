resource "garage_bucket" "observability" {
        global_alias = "observability"
}

resource "garage_bucket_permission" "loki_keybinding" {
        bucket_id = garage_bucket.observability.id
        access_key_id = garage_key.observability_key.id
        read = true
        write = true
        owner = false
}
