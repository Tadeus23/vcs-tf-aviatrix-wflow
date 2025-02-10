resource "aviatrix_spoke_gateway" "spoke_gateway" {
  gw_name        = "spoke-gateway-test"  # GW name
  cloud_type     = 1                     # 1 for AWS
  account_name   = "AWS"     # Aviatrix account name
  vpc_id         = var.vpc_id            # VPC ID from variables
  subnet         = "10.117.252.64/27"    # Private subnet
  gw_size        = "small"               # 
  vpc_reg        = var.aws_region        # 
  enable_bgp     = true                  # Enable BGP if needed
  allocate_new_eip = false               # Do not allocate a new EIP to prevent public exposure
  eip           = "15.157.23.4"
  tags = {
    Name        = "Spoke Gateway Test"
    Environment = "Development"  # Add any additional tags as needed
  }

  # Security settings to prevent unintended exposure
  enable_private_oob                    = false   # Enable private out-of-band management
  enable_private_vpc_default_route      = true   # Use private VPC default route
  enable_skip_public_route_table_update  = true   # Skip public route table updates
}

# Security Group Configuration
resource "aws_security_group" "spoke_gateway_sg" {
  name        = "spoke-gateway-sg"
  description = "Security group for Spoke Gateway"
  vpc_id      = var.vpc_id

  # Inbound rules
  ingress {
    from_port   = 443                     # Allow HTTPS traffic
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]          # Restrict access to internal network CIDR
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"                    # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]           # Adjust as necessary for your security policy
  }
}

output "spoke_gateway_id" {
  value = aviatrix_spoke_gateway.spoke_gateway.id
}

