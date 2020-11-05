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


###【WINDOWS】###

resource "aws_instance" "windows" {
  count = var.windows_enabled ? 1 : 0

  ami                     = data.aws_ami.windows.id
  instance_type           = var.instance_type
  key_name                = var.key_name
  monitoring              = var.detailed_monitoring
  disable_api_termination = var.instance_termination_protection
  vpc_security_group_ids  = var.security_groups
  subnet_id               = var.subnet_id
  user_data               = filebase64("${path.module}/scripts/windows.ps1")
  iam_instance_profile    = aws_iam_instance_profile.ec2_profile.name
  availability_zone       = var.availability_zone
  get_password_data       = true


  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = var.ebs_delete_on_termination
    encrypted             = var.ebs_encrypted
    kms_key_id            = var.kms_key_id

  }

  volume_tags = {
    "Name" = local.prefix_name
  }

  tags = {
    "Name"        = var.name #local.prefix_name
    "tenant"      = local.common_tags.tenant
    "tenanttype"  = local.common_tags.tenanttype
    "environment" = local.common_tags.environment

  }
}

resource "aws_ebs_volume" "log_default" {
  count             = var.log_volume_count
  availability_zone = var.availability_zone
  encrypted         = var.ebs_encrypted
  kms_key_id        = var.kms_key_id
  size              = var.log_volume_size
  #iops              = var.ebs_iops
  type = var.ebs_volume_type

  tags = {
    "Name" = local.prefix_name
  }

}

resource "aws_volume_attachment" "log_default" {
  count       = var.log_volume_count
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.log_default.*.id[count.index]
  instance_id = join("", aws_instance.windows.*.id)
}

resource "aws_ebs_volume" "backup_default" {
  count             = var.backup_volume_count
  availability_zone = var.availability_zone
  encrypted         = var.ebs_encrypted
  kms_key_id        = var.kms_key_id
  size              = var.backup_volume_size
  #iops              = var.ebs_iops
  type = var.ebs_volume_type

  tags = {
    "Name" = local.prefix_name
  }

}

resource "aws_volume_attachment" "backup_default" {
  count       = var.backup_volume_count
  device_name = "/dev/xvdc"
  volume_id   = aws_ebs_volume.backup_default.*.id[count.index]
  instance_id = join("", aws_instance.windows.*.id)
}

resource "aws_ebs_volume" "temp_default" {
  count             = var.temp_volume_count
  availability_zone = var.availability_zone
  encrypted         = var.ebs_encrypted
  kms_key_id        = var.kms_key_id
  size              = var.temp_volume_size
  #iops              = var.ebs_iops
  type = var.ebs_volume_type

  tags = {
    "Name" = local.prefix_name
  }

}

resource "aws_volume_attachment" "temp_default" {
  count       = var.temp_volume_count
  device_name = "/dev/xvdd"
  volume_id   = aws_ebs_volume.temp_default.*.id[count.index]
  instance_id = join("", aws_instance.windows.*.id)
}


###【LINUX】###

resource "aws_instance" "linux" {
  count = var.linux_enabled ? 1 : 0

  ami                     = data.aws_ami.linux.id
  instance_type           = var.instance_type
  key_name                = var.key_name
  monitoring              = var.detailed_monitoring
  disable_api_termination = var.instance_termination_protection
  vpc_security_group_ids  = var.security_groups
  subnet_id               = var.subnet_id
  user_data               = filebase64("${path.cwd}/scripts/${var.linux_user_data}.sh")
  iam_instance_profile    = aws_iam_instance_profile.ec2_profile.name
  availability_zone       = var.availability_zone


  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = var.ebs_delete_on_termination
    encrypted             = var.ebs_encrypted
    kms_key_id            = var.kms_key_id

  }

  volume_tags = {
    "Name" = local.prefix_name
  }

  tags = {
    "Name"        = var.name #local.prefix_name
    "tenant"      = local.common_tags.tenant
    "tenanttype"  = local.common_tags.tenanttype
    "environment" = local.common_tags.environment

  }
}

resource "aws_ebs_volume" "linux_log_default" {
  count             = var.log_volume_count
  availability_zone = var.availability_zone
  encrypted         = var.ebs_encrypted
  kms_key_id        = var.kms_key_id
  size              = var.log_volume_size
  #iops              = var.ebs_iops
  type = var.ebs_volume_type

  tags = {
    "Name" = local.prefix_name
  }

}

resource "aws_volume_attachment" "linux_log_default" {
  count       = var.log_volume_count
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.linux_log_default.*.id[count.index]
  instance_id = join("", aws_instance.linux.*.id)
}

resource "aws_ebs_volume" "linux_backup_default" {
  count             = var.backup_volume_count
  availability_zone = var.availability_zone
  encrypted         = var.ebs_encrypted
  kms_key_id        = var.kms_key_id
  size              = var.backup_volume_size
  #iops              = var.ebs_iops
  type = var.ebs_volume_type

  tags = {
    "Name" = local.prefix_name
  }

}

resource "aws_volume_attachment" "linux_backup_default" {
  count       = var.backup_volume_count
  device_name = "/dev/xvdc"
  volume_id   = aws_ebs_volume.linux_backup_default.*.id[count.index]
  instance_id = join("", aws_instance.linux.*.id)
}

resource "aws_ebs_volume" "linux_temp_default" {
  count             = var.temp_volume_count
  availability_zone = var.availability_zone
  encrypted         = var.ebs_encrypted
  kms_key_id        = var.kms_key_id
  size              = var.temp_volume_size
  #iops              = var.ebs_iops
  type = var.ebs_volume_type

  tags = {
    "Name" = local.prefix_name
  }

}

resource "aws_volume_attachment" "linux_temp_default" {
  count       = var.temp_volume_count
  device_name = "/dev/xvdd"
  volume_id   = aws_ebs_volume.linux_temp_default.*.id[count.index]
  instance_id = join("", aws_instance.linux.*.id)
}
