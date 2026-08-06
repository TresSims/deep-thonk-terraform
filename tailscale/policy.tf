resource "tailscale_acl" "as_json" {
  acl = <<EOF
    {
      "tagOwners" : {
        "tag:k8s-operator" : ["autogroup:admin"],
        "tag:k8s" : ["tag:k8s-operator"],
      },
      "autoApprovers" : {
        "services" : {
          "tag:k8s" : ["tag:k8s"],
        },
      },
      "acls" : [
        // Allow everything to talk to everything on the tailnet. This should
        // be used on personal and test tailnets only.
        { "action" : "accept", "src" : ["*"], "dst" : ["*:*"] },
      ],
      "grants" : [
        // Allow everything on the tailnet to talk to the API Server Proxy. This should
        // be used on personal and test tailnets only.
        {
          "src" : ["*"],
          "dst" : ["tag:k8s-operator"],
          "ip" : ["tcp:443"],
        },
      ],
      "nodeAttrs" : [
        // Let the Kubernetes operator use Tailscale Funnel
        {
          "target" : ["tag:k8s"], // tag that the Tailscale operator uses to tag proxies; defaults to 'tag:k8s'
          "attr" : ["funnel"],
        },
      ],
    }
  EOF
}
