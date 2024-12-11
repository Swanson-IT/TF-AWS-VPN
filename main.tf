# Customer Gateway
resource "aws_customer_gateway" "this" {
  bgp_asn    = var.bgp_asn
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"

  tags = {
    Name = var.customer_gateway_name
  }
}

# VPN Gateway
resource "aws_vpn_gateway" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.vpn_gateway_name
  }
}

# VPN Connection
resource "aws_vpn_connection" "this" {
  customer_gateway_id   = aws_customer_gateway.this.id
  vpn_gateway_id        = aws_vpn_gateway.this.id
  type                  = "ipsec.1"
  tunnel1_preshared_key = var.tunnel1_preshared_key
  static_routes_only    = var.static_routes_only

  tags = {
    Name = var.vpn_connection_name
  }
}