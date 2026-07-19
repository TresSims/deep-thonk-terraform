resource "vault_ldap_auth_backend" "sims_family_ldap" {
    path              = "ldap"
    url               = "ldaps://lldap.k8s.sims.family"
    userdn            = "OU=Users,OU=Accounts,DC=example,DC=org"
    userattr          = "sAMAccountName"
    upndomain         = "EXAMPLE.ORG"
    discoverdn        = false
    groupdn           = "OU=Groups,DC=example,DC=org"
    groupfilter       = "(&(objectClass=group)(member:1.2.840.113556.1.4.1941:={{.UserDN}}))"
    rotation_schedule = "0 * * * SAT"
    rotation_window   = 3600
    request_timeout               = 30
    dereference_aliases           = "always"
    enable_samaccountname_login   = false
    anonymous_group_search        = false
}
