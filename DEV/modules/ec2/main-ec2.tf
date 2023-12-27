# ### Deploy Nginx Reverse Proxy 01 AZ-b ###

# resource "aws_instance" "nginxRP-01b" {
#   ami           = var.ami
#   instance_type = var.ec2_instance_type
#   #iam_instance_profile = "EC2-SSM"
#   availability_zone = var.avz-A
#   subnet_id         = var.private_subnet_a
#   key_name          = var.key_name
#   root_block_device {
#     volume_size = var.volume_size
#     volume_type = var.volume_type
#   }
#   user_data = <<-EOF
#     #!/bin/bash
#        sudo su
#        yum update -y
#        yum install httpd -y
#        systemctl start httpd
#        systemctl enable httpd
#        echo "<html><h1> Welcome from $(hostname -f)...</p> </h1>
#   EOF
#   tags = {
#     Name        = var.project_name
#     Environment = var.env
#   }

#   vpc_security_group_ids = ["${var.sg}"]
# }

# resource "aws_instance" "nginxRP-01a" {
#   ami           = var.ami
#   instance_type = var.ec2_instance_type
#   #iam_instance_profile = "EC2-SSM"
#   availability_zone = var.avz-A
#   subnet_id         = var.private_subnet_a
#   key_name          = var.key_name
#   root_block_device {
#     volume_size = var.volume_size
#     volume_type = var.volume_type
#   }
#   user_data = <<-EOF
#     #!/bin/bash
#        sudo su
#        yum update -y
#        yum install httpd -y
#        systemctl start httpd
#        systemctl enable httpd
#        echo "<html><h1> Welcome from $(hostname -f)...</p> </h1>
#   EOF
#   tags = {
#     Name        = var.project_name
#     Environment = var.env
#   }

#   vpc_security_group_ids = ["${var.sg}"]
# }
