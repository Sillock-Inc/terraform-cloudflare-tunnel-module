data "cloudflare_zone" "zone" {
  name = var.zone_dns
}