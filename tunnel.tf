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
      service = "http://default:80"
    }

  }
}