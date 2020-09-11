variable "region" {
  type        = string
  description = "The AWS Region"
}

variable "owners" {
  #type        = list(string)
  description = "The AMI owners (e.g AWS account ID, self (the current account), or an AWS owner alias (e.g. amazon, aws-marketplace, microsoft)"
  default     = ["self", "amazon"]
}

variable "linux_image_id" {
  type        = string
  description = "The EC2 image id name to launch"
  default     = ""
}

variable "windows_image_id" {
  type        = string
  description = "The EC2 image id name to launch"
  default     = ""
}


variable "windows_enabled" {
  type        = bool
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources"
  default     = false
}

variable "linux_enabled" {
  type        = bool
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources"
  default     = false
}


variable "instance_type" {
  type        = string
  description = "List of nested arguments provides the ability to specify multiple instance types"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "The key name to use for the instance"
  default     = ""
}

variable "monitoring" {
  type        = bool
  description = "Whether to enable detailed monitoring. Set to 'true' to enable. Default value set to false"
  default     = false
}

//variable "vpc_id" {
//  type        = string
//  description = "The ID of the VPC that the instance security group belongs to"
//}
//
//variable "subnet" {
//  type        = string
//  description = "VPC Subnet ID the instance is launched in"
//}

variable "security_groups" {
  description = "List of Security Group IDs allowed to connect to the instance"
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  default     = ""
}

variable "aws_vpc" {
  type        = list(string)
  description = "A list of vpc"
  default     = []
}




###【TAGS】###

variable "name" {
  type        = string
  description = "Tenants represent a logical grouping of client(s) or services, either by region, specific needs, or other criteria"
  default     = "mso"
}

variable "tenant" {
  type        = string
  description = "Tenants represent a logical grouping of client(s) or services, either by region, specific needs, or other criteria"
  default     = "us-west-2"
}

variable "tenant_type" {
  type        = string
  description = "Tenant types represent larger verticals/categories that exist within the business and our ecosystem (e.g Ticketing, Tools)"
  default     = ""
}

variable "environment" {
  type        = string
  description = "The type of environment (e.g dev1, qa2, stage1, prod)"
  default     = "production"
}

variable "delimiter" {
  type        = string
  description = "Delimiter to be used between label (e.g '-')"
  default     = "-"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "managedby" {
  type        = string
  description = "Managed by Terraform"
  default     = "terraform"

}

variable "tags" {
  type        = map(string)
  description = "Additional tags for resources"
  default     = {}
}
