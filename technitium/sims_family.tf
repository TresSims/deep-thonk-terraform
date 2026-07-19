resource "technitium_zone" "sims_family" {
  name = "sims.family"
  type = "Primary"
}

resource "technitium_record" "sims_family" {
  zone  = technitium_zone.sims_family.name
  name  = "sims.family"
  type  = "A"
  value = "192.168.1.25"
  ttl   = 300
}

resource "technitium_record" "star_sims_family" {
  zone  = technitium_zone.sims_family.name
  name  = "*.sims.family"
  type  = "CNAME"
  value = "sims.family"
  ttl   = 300
}

resource "technitium_zone" "k8s_sims_family" {
  name = "k8s.sims.family"
  type = "Primary"
}

resource "technitium_record" "k8s_sims_family" {
  zone  = technitium_zone.k8s_sims_family.name
  name  = "k8s.sims.family"
  type  = "A"
  value = "192.168.1.5"
  ttl   = 300
}

resource "technitium_record" "star_k8s_sims_family" {
  zone  = technitium_zone.k8s_sims_family.name
  name  = "*.k8s.sims.family"
  type  = "CNAME"
  value = "k8s.sims.family"
  ttl   = 300
}
