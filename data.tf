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

# data "aws_vpc" "default" {
#   default = false
#   id      = var.aws_vpc
# }

# data "aws_subnet_id" "default" {
#   vpc_id = data.aws_vpc.default.id

#   filter {
#     name   = "tag:Name"
#     values = var.subnet_id
#   }
# }

# data "template_file" "user_data" {
#   template = file("${path.module}/scripts/windows.ps1")
# }
