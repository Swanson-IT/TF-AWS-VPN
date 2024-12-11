variable "vpc_id" {
  description = "ID of the VPC to attach the VPN Gateway"
  type        = string
}

variable "tunnel1_preshared_key" {
  description = "Key for the VPN Gateway"
  type        = string
}

variable "customer_gateway_ip" {
  description = "Public IP address of the customer gateway"
  type        = string
}

variable "static_routes_only" {
  description = "Whether to use static routes instead of dynamic routing with BGP"
  type        = bool
  default     = true
}

variable "customer_gateway_name" {
  description = "Name for the customer gateway"
  type        = string
}

variable "vpn_gateway_name" {
  description = "Name for the VPN gateway"
  type        = string
}

variable "vpn_connection_name" {
  description = "Name for the VPN connection"
  type        = string
}