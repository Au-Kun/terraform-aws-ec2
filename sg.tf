resource "aws_security_group" "rundeck" {
  name        = local.prefix_name
  description = "Allow HTTP/S inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow inbound traffic to Rundeck"
    from_port   = 4440
    to_port     = 4440
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    var.tags,
    {
      "Name" = format("%s %s", local.prefix_name,"-lb")
    },
  )
}