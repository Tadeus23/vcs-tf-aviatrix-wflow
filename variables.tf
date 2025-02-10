variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "ca-central-1"
}

variable "vpc_id" {
  description = "The VPC ID where the Aviatrix spoke gateway will be deployed"
  type        = string
}

variable "aviatrix_controller_ip" {
  description = "The IP address of the Aviatrix Controller"
  type        = string
}

variable "aviatrix_username" {
  description = "Aviatrix Controller username"
  type        = string
}

variable "aviatrix_password" {
  description = "Aviatrix Controller password"
  type        = string
  sensitive   = true
}

variable "gw_name" {
  description = "The name of the spoke gateway"
  type        = string
  default     = "spoke-gateway-test"
}

variable "cloud_type" {
  description = "The cloud type for the spoke gateway (1 for AWS)"
  type        = number
  default     = 1
}

variable "subnet" {
  description = "The private subnet for the spoke gateway"
  type        = string
  default     = "10.117.252.64/27"
}

variable "gw_size" {
  description = "The size of the gateway"
  type        = string
  default     = "small"
}

variable "enable_bgp" {
  description = "Enable BGP for the spoke gateway"
  type        = bool
  default     = true
}

variable "allocate_new_eip" {
  description = "Allocate a new Elastic IP for the gateway"
  type        = bool
  default     = false
}

variable "eip" {
  description = "Elastic IP address for the gateway"
  type        = string
  default     = "15.157.23.4"
}

variable "tags" {
  description = "Tags for the spoke gateway"
  type        = map(string)
  default     = {
    Name        = "Spoke Gateway Test"
    Environment = "Development"
  }
}

variable "security_group_name" {
  description = "Name of the security group for the spoke gateway"
  type        = string
  default     = "spoke-gateway-sg"
}

variable "security_group_description" {
  description = "Description of the security group for the spoke gateway"
  type        = string
  default     = "Security group for Spoke Gateway"
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks for ingress rules"
  type        = list(string)
  default     = ["10.0.0.0/8"]
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "enable_private_oob" {
  description = "Enable private out-of-band management"
  type        = bool
  default     = false
}

variable "enable_private_vpc_default_route" {
  description = "Use private VPC default route"
  type        = bool
  default     = true
}

variable "enable_skip_public_route_table_update" {
  description = "Skip public route table updates"
  type        = bool
  default     = true
}
