data "aws_ami" "linux" {
  most_recent = true
  owners      = var.owners

  filter {
    name   = "name"
    values = [var.linux_image_id]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "windows" {
  most_recent = true
  owners      = var.owners

  filter {
    name   = "name"
    values = [var.windows_image_id]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "default" {
  default = false
  id      = var.aws_vpc
}
