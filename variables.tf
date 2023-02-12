variable "cloudflare_account_id" {
  type        = string
  description = "Account ID for the Cloudflare account to provision resources under"
  default     = ""
}

variable "tunnel_name" {
  type        = string
  description = "DNS name for the tunnel e.g. `example.com`"
  default     = ""
}

variable "ingress_rules" {
  type = list(object({
    subdomain = string
    address   = string
  }))
  description = "Subdomain name and kubernetes KubeDNS name as a key value pair for Cloudflare tunnel config"

  default = [{
    address   = ""
    subdomain = ""
  }]
}

variable "zone_dns" {
  type        = string
  description = "DNS name for the tunnel e.g. `example.com`"
  default     = ""
}