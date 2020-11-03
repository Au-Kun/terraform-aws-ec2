variable "region" {
  type        = string
  description = "The AWS Region"
}

variable "owners" {
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
  default     = ""
}

variable "key_name" {
  type        = string
  description = "The key name to use for the instance"
  default     = ""
}

variable "detailed_monitoring" {
  type        = bool
  description = "Whether to enable detailed monitoring. Set to 'true' to enable. Default value set to false"
  default     = false
}

variable "instance_termination_protection" {
  type        = bool
  description = "If true, enables EC2 Instance Termination Protection"
  default     = false

}

# variable "vpc_id" {
#   type        = string
#   description = "The ID of the VPC that the instance security group belongs to"
# }

variable "aws_vpc" {
  type        = string
  description = "A list of vpc"
  default     = ""
}

variable "subnet_id" {
  type        = string
  description = "subnet ID to launch the resources in"
  default     = ""
}

# variable "subnet_id" {
#   type        = list(string)
#   description = "A list of subnet IDs to launch the resources in"
#   default     = [""]
# }

variable "security_groups" {
  description = "List of Security Group IDs allowed to connect to the instance"
  type        = list(string)
  default     = []
}

# variable "user_data" {
#   description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
#   default     = ""
# }

variable "availability_zone" {
  type        = string
  description = "The AZ where the resource will exist"
  default     = "us-west-2b"
}

###【VOLUMES】###

variable "root_volume_type" {
  type        = string
  description = "The type of volume. 'gp2', 'io1', 'io2', 'sc1', or 'st1'. (Default: 'gp2')."
  default     = "gp2"
}

variable "root_volume_size" {
  type        = number
  description = "The size of the volume in gibibytes"
  default     = 60
}

variable "ebs_delete_on_termination" {
  type        = bool
  description = "Whether the volume should be destroyed on instance termination (Default: false)"
  default     = false
}

variable "ebs_encrypted" {
  type        = bool
  description = "Enable volume encryption. (Default: false)"
  default     = false
}

variable "kms_key_id" {
  type        = string
  description = "Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume"
  default     = ""
}

variable "ebs_volume_count" {
  type        = number
  description = "The number of ebs volume to create"
  default     = 0
}

variable "ebs_log_volume_size" {
  type        = number
  description = "The size of the drive in GiBs"
  default     = 60
}

variable "ebs_iops" {
  type        = string
  description = "The amount of IOPS to provision for the disk. Only valid for type of io1 or io2"
  default     = ""
}

variable "ebs_volume_type" {
  type        = string
  description = "The type of EBS volume. Can be 'standard', 'gp2', 'io1', 'io2', 'sc1' or 'st1' (Default: 'gp2')"
  default     = "gp2"
}

variable "ebs_device_name" {
  type        = list(string)
  description = "Name of the EBS device to mount"
  default     = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]
}

variable "ebs_backup_volume_size" {
  type        = number
  description = "The size of the drive in GiBs"
  default     = 60
}

variable "ebs_temp_volume_size" {
  type        = number
  description = "The size of the drive in GiBs"
  default     = "60"
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

# OPTIONAL TAGS
variable "tags" {
  type        = map(string)
  description = "Additional tags for resources"
  default     = {}
}
