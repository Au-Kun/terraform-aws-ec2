module "amomnisrc" {
  source                       = "../../../../terraform-aws-ec2"
  region                       = "us-west-2"
  #linux_image_id               = "amzn-ami-*"
  windows_image_id             = "Windows-Server-2016-Base-*"
  linux_enabled                = false
  windows_enabled              = true
  instance_type                = "t2.micro"
  key_name                     = "prod-us-west-2"
  detailed_monitoring          = "false"
  disable_instance_termination = "true"
  security_groups              = ["sg-05c5dc1c7e575d6d0", "sg-0695fcc06cac5cd38"]
  root_volume_type             = "gp2"
  root_volume_size             = 180
  delete_on_termination        = false
  ebs_encrypted                = true
  kms_key_id                   = "arn:aws:kms:us-west-2:868165799083:key/b4a18de9-6a05-4c5c-b8c7-a3818c420b3f"
  ebs_volume_count             = 1
  ebs_log_volume_size          = 400
  ebs_volume_type              = "gp2"
  ebs_backup_volume_size       = 2000
  ebs_temp_volume_size         = 1000
  aws_vpc                      = "vpc-02ddb003195dba899"
  subnet_id                    = "subnet-0441a612ef3f3068c"

}
