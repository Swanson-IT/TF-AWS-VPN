# TF-AWS-VPN

# Terraform AWS Site-to-Site VPN Module

This Terraform module creates a Site-to-Site VPN connection in AWS, including the necessary Customer Gateway, VPN Gateway, and VPN Connection resources.

## Usage

To use this module, include it in your Terraform configuration, specifying the required variables.

### Example

```hcl
module "site_to_site_vpn" {
  source = "github.com/Swanson-IT/TF-AWS-SiteToSiteVPN?v1.0" # Use v1.0 tag

  vpc_id                = "vpc-1234567890abcdef0"           # ID of the VPC to attach the VPN Gateway
  customer_gateway_ip   = "203.0.113.12"                    # Public IP address of the customer gateway
  bgp_asn               = 65000                             # BGP ASN for the customer gateway
  static_routes_only    = false                             # Use static routes or dynamic routing
  customer_gateway_name = "my-customer-gateway"             # Name for the customer gateway
  vpn_gateway_name      = "my-vpn-gateway"                  # Name for the VPN gateway
  vpn_connection_name   = "my-vpn-connection"               # Name for the VPN connection
}