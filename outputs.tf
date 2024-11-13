output "customer_gateway_id" {
  description = "ID of the Customer Gateway"
  value       = aws_customer_gateway.this.id
}

output "vpn_gateway_id" {
  description = "ID of the VPN Gateway"
  value       = aws_vpn_gateway.this.id
}

output "vpn_connection_id" {
  description = "ID of the VPN Connection"
  value       = aws_vpn_connection.this.id
}