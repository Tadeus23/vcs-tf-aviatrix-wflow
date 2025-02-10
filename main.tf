resource "aviatrix_spoke_gateway" "spoke_gateway" {
  gw_name        = var.gw_name            # GW name
  cloud_type     = var.cloud_type         # 1 for AWS
  account_name   = "AWS"                  # Aviatrix account name
  vpc_id         = var.vpc_id             # VPC ID from variables
  subnet         = var.subnet              # Private subnet
  gw_size        = var.gw_size             #
  vpc_reg        = var.aws_region          #
  enable_bgp     = var.enable_bgp         # Enable BGP if needed
  allocate_new_eip = var.allocate_new_eip  # Do not allocate a new EIP to prevent public exposure
  eip           = var.eip                  # Elastic IP
  tags          = var.tags                 # Tags

  # Security settings to prevent unintended exposure
  enable_private_oob                    = var.enable_private_oob  # Enable private out-of-band management
  enable_private_vpc_default_route      = var.enable_private_vpc_default_route  # Use private VPC default route
  enable_skip_public_route_table_update  = var.enable_skip_public_route_table_update  # Skip public route table updates
}

# Security Group Configuration
resource "aws_security_group" "spoke_gateway_sg" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  # Inbound rules
  ingress {
    from_port   = 443                     # Allow HTTPS traffic
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr_blocks  # Restrict access to internal network CIDR
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                    # Allow all outbound traffic
    cidr_blocks = var.egress_cidr_blocks   # Adjust as necessary for your security policy
  }
}

output "spoke_gateway_id" {
  value = aviatrix_spoke_gateway.spoke_gateway.id
}

