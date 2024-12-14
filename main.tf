# Customer Gateway
resource "aws_customer_gateway" "this" {
  ip_address = var.customer_gateway_ip
  bgp_asn    = "65000"
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
  static_routes_only    = true # Static routing instead of BGP
  tunnel1_preshared_key = var.tunnel1_preshared_key

  tags = {
    Name = var.vpn_connection_name
  }
}

# Static Route
resource "aws_vpn_connection_route" "this" {
  destination_cidr_block = "10.0.0.0/16" # Replace with your desired CIDR
  vpn_connection_id      = aws_vpn_connection.this.id
}