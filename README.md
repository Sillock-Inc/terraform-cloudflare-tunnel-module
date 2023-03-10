# terraform-cloudflare-tunnel-module

![Terraform CLI](https://github.com/Sillock-Inc/terraform-cloudflare-tunnel-module/actions/workflows/continuous-integration.yml/badge.svg)
[![GitHub release](https://img.shields.io/github/release/Sillock-Inc/terraform-cloudflare-tunnel-module)](https://github.com/Sillock-Inc/terraform-cloudflare-tunnel-module/releases)

This module creates and manages Cloudflare tunnels, deployed with appropriate cname records

## Usage

```hcl
module "cloudflare_tunnel" {
  source = "github.com/Sillock-Inc/terraform-cloudflare-tunnel-module?ref=v0.1.0"

  cloudflare_account_id = "123456789"
  tunnel_name           = "my tunnel"
  ingress_rules         = [
    {
        "subdomain" = "subdomain"
        "address"   = "https://example.com:443"
    }
  ]
  zone_dns              = "example.com"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 3.0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Resources

| Name | Type |
|------|------|
| [cloudflare_argo_tunnel.tunnel](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/argo_tunnel) | resource |
| [cloudflare_record.dns](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_tunnel_config.config](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/tunnel_config) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [cloudflare_zone.zone](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | Account ID for the Cloudflare account to provision resources under | `string` | `""` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | Subdomain name and kubernetes KubeDNS name as a key value pair for Cloudflare tunnel config | <pre>list(object({<br>    subdomain = string<br>    address   = string<br>  }))</pre> | <pre>[<br>  {<br>    "address": "",<br>    "subdomain": ""<br>  }<br>]</pre> | no |
| <a name="input_tunnel_name"></a> [tunnel\_name](#input\_tunnel\_name) | DNS name for the tunnel e.g. `example.com` | `string` | `""` | no |
| <a name="input_zone_dns"></a> [zone\_dns](#input\_zone\_dns) | DNS name for the tunnel e.g. `example.com` | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tunnel_token"></a> [tunnel\_token](#output\_tunnel\_token) | n/a |
<!-- END_TF_DOCS -->
