# terraform-config

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


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="cloudflare_account_id"></a> [cloudflare\_account\_id](#cloudflare\_account\_id) | Account ID in Cloudflare for the tunnel to be created under | `string` | n/a | yes |
| <a name="tunnel_name"></a> [tunnel\_name](#tunnel\_name) | Name of the tunnel to be created for Cloudflare, used for display purposes in the Cloudflare dashboard | `string` | n/a | yes |
| <a name="ingress_rules"></a> [ingress\_rules](#ingress\_rules) | List of key value pairs for routing rules for the Cloudflare tunnel, where the subdomain value to match and the address is where the traffic is routed to | `list(object)` | n/a | yes |
| <a name="zone_dns"></a> [zone\_dns](#zone\_dns) | Domain name for retrieving the Cloudflare Zone where the CNAME records will be created under | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tunnel_token"></a> [tunnel\_token](#output\_tunnel_token) | Token for connecting to the provisioned Cloudflare tunnel |
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

## Modules

No modules.

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
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | Account ID for the Cloudflare account to provision resources under | `string` | n/a | yes |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | Subdomain name and kubernetes KubeDNS name as a key value pair for Cloudflare tunnel config | <pre>list(object({<br>    subdomain = string<br>    address   = string<br>  }))</pre> | n/a | yes |
| <a name="input_tunnel_name"></a> [tunnel\_name](#input\_tunnel\_name) | DNS name for the tunnel e.g. `example.com` | `string` | n/a | yes |
| <a name="input_zone_dns"></a> [zone\_dns](#input\_zone\_dns) | DNS name for the tunnel e.g. `example.com` | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tunnel_token"></a> [tunnel\_token](#output\_tunnel\_token) | n/a |
<!-- END_TF_DOCS -->