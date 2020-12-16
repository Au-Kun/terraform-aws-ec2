terraform-aws-ec2
---

Terraform module for provisioning EC2 Instances (Windows and/or Linux)

## Usage

Create a terraform.tfvars files and include the variables values.

## Example

terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | AWS Region | string | - | yes |
| owners | The AMI owners (e.g AWS account ID, self (the current account), or an AWS owner alias (e.g. amazon, aws-marketplace, microsoft)  | list | ["self", "amazon"] | no |
| windows_image_id | The EC2 image id name to launch | string | "Windows-Server-2019-Base-*" | no |
| windows_enabled | Whether to create the resources. Set to `false` to prevent the module from creating any resources | bool | false | no |
| windows_log_ebs_enabled | Whether to create the ebs resources. Set to `false` to prevent the module from creating any resources | bool | false | no |
| windows_backup_ebs_enabled | Whether to create the ebs resources. Set to `false` to prevent the module from creating any resources | bool | false | no |
| backup_volume_type | The type of volume. 'gp2', 'io1', 'io2', 'sc1', or 'st1'. (Default: 'gp2') | string | gp2 | no |
| backup_volume_size | The size of the drive in GiBs | number | 60 | no |
| windows_temp_ebs_enabled | Whether to create the ebs resources. Set to `false` to prevent the module from creating any resources | bool | false | no |
| windows_bin_ebs_enabled | Whether to create the ebs resources. Set to `false` to prevent the module from creating any resources | bool | false | no |
| windows_user_data | User data script to use (e.g. windows_2016 or windows_2019) | string | windows_2016 | no |
| linux_enabled | Whether to create the resources. Set to `false` to prevent the module from creating any resources | bool | false | no |
| linux_image_id | The EC2 image id name to launch | string | "Linux-ami-*" | no |
| linux_log_ebs_enabled | Whether to create the ebs resources. Set to `false` to prevent the module from creating any resources | bool | false | no |
| linux_backup_ebs_enabled | Whether to create the ebs resources. Set to `false` to prevent the module from creating any resources | bool | false | no |
| linux_temp_ebs_enabled | Whether to create the ebs resources. Set to `false` to prevent the module from creating any resources | bool | false | no |
| instance_type | Specify instance types (e.g. t2.micro) | string | t2.micro | no |
| key_name | The key name to use for the instance | string | - | yes |
| detailed_monitoring | Whether to enable detailed monitoring. Set to 'true' to enable. Default value set to false | bool | false | no |
| instance_termination_protection | If true, enables EC2 Instance Termination Protection | bool | false | no |
| aws_vpc | The vpc id | string | - | yes |
| subnet_id | Subnet ID to launch the resources in | string | - | yes |
| security_groups | List of Security Group IDs allowed to connect to the instance | list(string) | - | yes |
| availability_zone | The AZ where the resource will exist | string | us-west-2b | no |
| linux_user_data | User data script to use (e.g. linux) | string | linux | no |
| root_volume_type | The type of volume. 'gp2', 'io1', 'io2', 'sc1', or 'st1'. (Default: 'gp2') | string | gp2 | no |
| root_iops | The amount of provisioned IOPS. This is only valid for volume_type of 'io1/io2' | number | 0 | no |
| root_volume_size | The size of the volume in gibibytes | number | 80 | no |
| root_ebs_delete_on_termination | Whether the volume should be destroyed on instance termination (Default: false) | bool | false | no |
| ebs_encrypted | Enable volume encryption. (Default: false) | bool | false | no |
| kms_key_id | Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume | string | - | yes |
| log_volume_size | The size of the drive in GiBs | number | 60 | no |
| log_volume_type | The type of EBS volume. Can be 'standard', 'gp2', 'io1', 'io2', 'sc1' or 'st1' (Default: 'gp2') | string | gp2 | no |
| log_iops | The amount of IOPS to provision for the disk. Only valid for type of io1 or io2 | number | 0 | no |
| backup_iops | The amount of IOPS to provision for the disk. Only valid for type of io1 or io2 | number | 0 | no |
| temp_volume_size | The size of the drive in GiBs | number | 60 | no |
| temp_volume_type | The type of volume. 'gp2', 'io1', 'io2', 'sc1', or 'st1'. (Default: 'gp2') | string | gp2 | no |
| temp_iops | The amount of provisioned IOPS. This is only valid for volume_type of 'io1/io2' | number | 0 | no |
| bin_volume_size | The size of the drive in GiBs | number | 60 | no |
| bin_volume_type | The type of volume. 'gp2', 'io1', 'io2', 'sc1', or 'st1'. (Default: 'gp2') | string | gp2 | no |
| bin_iops | The amount of provisioned IOPS. This is only valid for volume_type of 'io1/io2' | number | 0 | no |
| ebs_device_name | Name of the EBS device to mount | list(string) | ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"] | no |
| name | The name of the resource | string | - | yes |
| application_name | The name of the resource | string | - | yes |
| application_type | Application type represent the type of application (e.g monitoring, db) | string | - | yes |
| stack | Stack represent the type of environment (e.g dev, qa, stage, prod) | string | - | yes |
| delimiter | Delimiter to be used between label (e.g '-') | string | - | no |
| attributes | Additional attributes (e.g. `1`) | list(string) | - | no |
| managedby | Managed by Terraform | string | terraform | no |

