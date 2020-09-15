locals {
  prefix_name = lower(join(var.delimiter, compact(concat(list(var.tenant, var.environment, var.tenant_type), var.attributes))))
}

locals {
  common_tags = {
    name        = local.prefix_name
    tenant      = lower(var.tenant)
    tenanttype  = lower(var.tenant_type)
    environment = lower(var.environment)
    managedby   = lower(var.managedby)
  }
}

//resource "aws_instance" "windows" {
//  count = var.windows_enabled ? 1 : 0
//
//  ami           = data.aws_ami.windows.id
//  instance_type = var.instance_type
//  key_name      = var.key_name
//  monitoring    = var.monitoring
//  #availability_zone           = local.availability_zone
//  user_data            = var.user_data
//  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
//
//
//
//  tags = {
//    "Name"        = local.prefix_name
//    "tenant"      = local.common_tags.tenant
//    "tenanttype"  = local.common_tags.tenanttype
//    "environment" = local.common_tags.environment
//
//  }
//}




resource "aws_instance" "linux" {
  count = var.linux_enabled ? 1 : 0

  ami           = data.aws_ami.linux.id
  instance_type = var.instance_type
  key_name      = var.key_name
  monitoring    = var.monitoring
  subnet_id     = "subnet-0e00e8fa7e8456b71"


  tags = {
    "Name"        = local.prefix_name
    "tenant"      = local.common_tags.tenant
    "tenanttype"  = local.common_tags.tenanttype
    "environment" = local.common_tags.environment

  }
}