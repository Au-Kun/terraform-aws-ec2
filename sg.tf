resource "aws_security_group" "lb" {
  name        = "${local.prefix_name}-lb"
  description = "Allow HTTP/S inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow HTTPS inbound traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP inbound traffic"
    from_port   = 80
    to_port     = 80
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
      "Name" = format("%s %s", local.prefix_name, "-lb")
    },
  )
}


resource "aws_security_group" "instance" {
  name        = "${local.prefix_name}-instance"
  description = "Allow HTTP/S inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description     = "Allow HTTPS inbound traffic"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.lb.id]
  }

  ingress {
    description     = "Allow HTTP inbound traffic"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb.id]
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
      "Name" = format("%s %s", local.prefix_name, "-instance")
    },
  )
}