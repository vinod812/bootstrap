variable "vpc_region" {
  description = "VPC Region"
  type        = string
  default     = "us-east-2"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.11.0.0/16"
}

variable "subnet_count" {
  description = "Number of subnets to create"
  type        = number
  default     = 1
}

variable "availability_zone" {
  description = "Zone for deployment"
  type        = string
  default     = "us-east-2a"
}