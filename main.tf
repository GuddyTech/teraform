resource "aws_launch_template" "launch_template1" {
  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = var.block_device_mappings_ebs.delete_on_termination
      encrypted             = var.block_device_mappings_ebs.encrypted
      iops                  = var.block_device_mappings_ebs.iops
      throughput            = var.block_device_mappings_ebs.throughput
      volume_size           = var.block_device_mappings_ebs.volume_size
      volume_type           = var.block_device_mappings_ebs.volume_type
    }
  }

  default_version         = var.default_version
  description             = local.aws
  disable_api_termination = "false"
  ebs_optimized           = "false"

  iam_instance_profile {
    arn = var.iam_instance_profile_arn
  }

  image_id = var.image_id
  //TODO: change instance type to requirement
  instance_type = "t3.large"
  instance_market_options {
    market_type = var.instance_market_options
  }
  network_interfaces {
    associate_public_ip_address = var.public_ip
    security_groups             = var.vpc_security_group_ids
  }
  key_name = var.key_name
  name     = var.name
  
  user_data = var.user_data

}
resource "aws_instance" "foo" {
  ami           = "ami-04c5e551d705c76b8" # us-west-2
  instance_type = var.instance_type
  subnet_id = "subnet-066a53d339c47bcc8"
#   network_interface {
#     network_interface_id = aws_network_interface.foo.id
#     device_index         = 0
#   }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
resource "aws_instance" "baa" {
  ami           = "ami-04c5e551d705c76b8" # us-west-2
  instance_type = var.instance_type
  subnet_id = "subnet-066a53d339c47bcc8"
  


#   network_interface {
#     network_interface_id = aws_network_interface.foo.id
#     device_index         = 0
#   }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

locals {
  aws =  upper(replace("i love aws because it pays me more", " ", ""  ))
  
}



