# IAM ROLE BEING CALLED FROM WITHIN TERRAGRUNT MODULE-FOR PURPOSES TESTING...

# # Create Instance Profile Role
# resource "aws_iam_instance_profile" "default_profile" {
#   name = local.prefix_name
#   role = aws_iam_role.ec2_role.name
# }

# # Create Assume Role for Resource
# resource "aws_iam_role" "ec2_role" {
#   name               = local.prefix_name
#   assume_role_policy = file("${path.module}/policies/ec2-assume-policy.json")
# }

# # Create Polices to Attach to Role
# resource "aws_iam_role_policy" "ec2_policy" {
#   name   = local.prefix_name
#   role   = aws_iam_role.ec2_role.id
#   policy = file("${path.module}/policies/ec2-policy.json")
# }