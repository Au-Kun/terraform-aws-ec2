module "amomnisrc_test" {
  source                       = "../../../../../terraform-aws-ec2"
  region                       = var.region
  linux_image_id               = var.linux_image_id
  windows_image_id             = var.windows_image_id
  linux_enabled                = var.linux_enabled
  windows_enabled              = var.windows_enabled
  instance_type                = var.instance_type
  key_name                     = var.key_name
  detailed_monitoring          = var.detailed_monitoring
  disable_instance_termination = var.disable_instance_termination
  security_groups              = var.security_groups
  user_data                    = var.user_data
  root_volume_type             = var.root_volume_type
  root_volume_size             = var.root_volume_size
  delete_on_termination        = var.delete_on_termination
  ebs_encrypted                = var.ebs_encrypted
  kms_key_id                   = var.kms_key_id
  ebs_volume_count             = var.ebs_volume_count
  ebs_log_volume_size          = var.ebs_log_volume_size
  ebs_volume_type              = var.ebs_volume_type
  ebs_backup_volume_size       = var.ebs_backup_volume_size
  ebs_temp_volume_size         = var.ebs_temp_volume_size
  #aws_vpc                      = "vpc-02ddb003195dba899"
  #subnet_id = "subnet-0441a612ef3f3068c"

}
