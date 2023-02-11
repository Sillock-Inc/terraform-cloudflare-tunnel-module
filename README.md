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