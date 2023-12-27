#SG Permit conections between resources (SERVERS and DB) inside of NETWORK ###

# resource "aws_security_group" "SG-permit-conections-network" {
#   #provider = aws.pdwebsite
#   name        = "SG Permit Network Conections"
#   description = "Permit Network Conections"
#   vpc_id      = var.vpc_id
#   ingress {
#     description = "SG-Permit Network Conections"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["10.71.67.0/25"]

#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     "Name"        = var.project_name
#     "Environment" = var.env
#   }
# }

