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

