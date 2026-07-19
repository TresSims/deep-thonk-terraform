resource "technitium_zone" "deep_thonk" {
  name = "deep-thonk.com"
  type = "Primary"
}

resource "technitium_record" "deep_thonk" {
  zone  = technitium_zone.deep_thonk.name
  name  = "deep-thonk.com"
  type  = "A"
  value = "192.168.1.25"
  ttl   = 300
}

resource "technitium_record" "star_deep_thonk" {
  zone  = technitium_zone.deep_thonk.name
  name  = "*.deep-thonk.com"
  type  = "CNAME"
  value = "deep-thonk.com"
  ttl   = 300
}

resource "technitium_zone" "k8s_deep_thonk" {
  name = "k8s.deep-thonk.com"
  type = "Primary"
}

resource "technitium_record" "k8s_deep_thonk" {
  zone  = technitium_zone.k8s_deep_thonk.name
  name  = "k8s.deep-thonk.com"
  type  = "A"
  value = "192.168.1.5"
  ttl   = 300
}

resource "technitium_record" "star_k8s_deep_thonk" {
  zone  = technitium_zone.k8s_deep_thonk.name
  name  = "*.k8s.deep-thonk.com"
  type  = "CNAME"
  value = "k8s.deep-thonk.com"
  ttl   = 300
}
