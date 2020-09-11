terraform-aws-ec2-auto-scale
---

Terraform module to provision autoscaling group.

## Usage



## Example

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| security_groups | AWS Region | string | - | yes |
| region | A list of security group(s) IDs (e.g. ["sg-xxxx"]  | list | - | yes |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map | `<map>` | no |