resource "random_password" "password" {
  length  = 64
  special = false
}

resource "cloudflare_argo_tunnel" "tunnel" {
  account_id = local.cloudflare_account_id
  name       = local.tunnel_name
  secret     = base64encode(random_password.password.result)
}

resource "cloudflare_tunnel_config" "config" {
  account_id = local.cloudflare_account_id
  tunnel_id  = cloudflare_argo_tunnel.tunnel.id
  
  config {

    dynamic "ingress_rule" {      
      for_each = local.ingress_rules
      iterator = item
      content {
        hostname = "${item.value.subdomain}.${local.zone_dns}"
        service  = item.value.address
      }
    }

    ingress_rule {
      service  = "http://default:80"
    }

  }
}

resource "cloudflare_record" "dns" {
  for_each = {for index, ingress_rule in local.ingress_rules:
    ingress_rule.subdomain => ingress_rule
  }
  name     = each.value.subdomain
  proxied  = true
  ttl      = 1
  type     = "CNAME"
  value    = "${cloudflare_argo_tunnel.tunnel.id}.cfargotunnel.com"
  zone_id  = data.cloudflare_zone.zone.id
}