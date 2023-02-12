resource "cloudflare_record" "dns" {
  for_each = { for index, ingress_rule in local.ingress_rules :
    ingress_rule.subdomain => ingress_rule
  }
  name    = each.value.subdomain
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "${cloudflare_argo_tunnel.tunnel.id}.cfargotunnel.com"
  zone_id = data.cloudflare_zone.zone.id
}