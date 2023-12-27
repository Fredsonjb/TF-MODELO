
######### Create vpc #######################
# resource "aws_vpc" "vpc" {
#   cidr_block           = "10.71.67.0/25"
#   enable_dns_hostnames = true
#   tags = {
#     "Name"        = var.project_name
#     "Environment" = var.env
#   }
# }

# ########## Create Public Subnet AZ A #############
# resource "aws_subnet" "public_subnet_a" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = "10.71.67.0/28"
#   availability_zone = var.avz-A
#   tags = {
#     "Name" = "Public-Subnet-${var.project_name}-${var.env}-1a"
#   }
# }
# ########## Create Public Subnet AZ B #############
# resource "aws_subnet" "public_subnet_b" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = "10.71.67.16/28"
#   availability_zone = var.avz-B
#   tags = {
#     "Name" = "Public-Subnet-${var.project_name}-${var.env}-1b"
#   }
# }
# ########## Create Public Subnet AZ C #############
# resource "aws_subnet" "public_subnet_c" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = "10.71.67.32/28"
#   availability_zone = var.avz-C
#   tags = {
#     "Name" = "Public-Subnet-${var.project_name}-${var.env}-1c"
#   }
# }
# ########## Create Private Subnet AZ A ############
# resource "aws_subnet" "private_subnet_a" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = "10.71.67.48/28"
#   availability_zone = var.avz-A
#   tags = {
#     "Name" = "Private-Subnet-${var.project_name}-${var.env}-1a"
#   }
# }

# ########## Create Private Subnet AZ B ############
# resource "aws_subnet" "private_subnet_b" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = "10.71.67.64/28"
#   availability_zone = var.avz-B
#   tags = {
#     "Name" = "Private-Subnet-${var.project_name}-${var.env}-1b"
#   }
# }
# ########## Create Private Subnet AZ C ############
# resource "aws_subnet" "private_subnet_c" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = "10.71.67.80/28"
#   availability_zone = var.avz-C
#   tags = {
#     "Name" = "Private-Subnet-${var.project_name}-${var.env}-1c"
#   }
# }


# ########## Nat GW IP #############################
# resource "aws_eip" "nat" {
#   #domain     = "vpc"
#   depends_on = [aws_internet_gateway.igw]
# }

# ######### Internet GW ###########################
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.vpc.id
#   tags = {
#     "Name" = "Internet Gateway VPC-${var.project_name}-${var.env}"
#   }
# }

# ########## Route Table  IGW ######################
# resource "aws_route_table" "router_IGW" {
#   vpc_id = aws_vpc.vpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
#   tags = {
#     "Name" = "Route to IGW-${var.project_name}-${var.env}"
#   }
# }


# ########## Association PUBLIC Subnet on Route Table #####
# resource "aws_route_table_association" "assoc_public_a" {
#   subnet_id      = aws_subnet.public_subnet_a.id
#   route_table_id = aws_route_table.router_IGW.id

# }
# resource "aws_route_table_association" "assoc_public_b" {
#   subnet_id      = aws_subnet.public_subnet_b.id
#   route_table_id = aws_route_table.router_IGW.id

# }
# resource "aws_route_table_association" "assoc_public_c" {
#   subnet_id      = aws_subnet.public_subnet_c.id
#   route_table_id = aws_route_table.router_IGW.id

# }

#---------------------------------------------------------------------#

# ########## Nat GW ################################
# resource "aws_nat_gateway" "nat_gw" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.public_subnet_a.id
#   depends_on    = [aws_internet_gateway.igw]
#   tags = {
#     "Name" = "NAT Gateway VPC-${var.project_name}-${var.env}"
#   }
# }

# ########## Route Table Nat GW ####################
# resource "aws_route_table" "router" {
#   vpc_id = aws_vpc.vpc.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gw.id
#   }
#   tags = {
#     "Name" = "Route to NAT GW-${var.project_name}-${var.env}"
#   }
# }

# ########## Association PRIVATE Subnet on Route Table #####
# resource "aws_route_table_association" "assoc_private_a" {
#   subnet_id      = aws_subnet.private_subnet_a.id
#   route_table_id = aws_route_table.router.id

# }

# resource "aws_route_table_association" "assoc_private_b" {
#   subnet_id      = aws_subnet.private_subnet_b.id
#   route_table_id = aws_route_table.router.id

# }
