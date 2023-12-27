
########### Create Cluster Aurora-MySQL ######################################

# resource "aws_rds_cluster_instance" "cluster_instances" {
#   #provider = aws.pdwebsite
#   count              = 2
#   identifier         = "${var.name_cluster_ident}-${count.index}"
#   cluster_identifier = aws_rds_cluster.database.id
#   instance_class     = var.db_instance_class
#   engine             = aws_rds_cluster.database.engine
#   engine_version     = aws_rds_cluster.database.engine_version
#   tags = {
#     "Name"    = var.project_name
#     "Env"     = var.env
    
#   }

# }

# resource "aws_rds_cluster" "database" {
#   #provider = aws.pdwebsite  
#   engine                 = var.db_engine
#   engine_version         = var.db_version
#   availability_zones     = [var.avz-A, var.avz-B, var.avz-C]
#   cluster_identifier     = var.name_cluster_ident
#   database_name          = var.dbname
#   master_username        = var.db_super_user
#   master_password        = var.db_password
#   skip_final_snapshot    = true
#   storage_encrypted      = true
#   backup_retention_period = 14
#   preferred_backup_window = "22:00-23:59"
#   db_subnet_group_name   = aws_db_subnet_group.db-subnet.id
#   vpc_security_group_ids = [var.sg]
#   db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.blue-green2.name
#   tags = {
#     "Name"    = var.project_name
#     "Env"     = var.env  
#   }

# }

# resource "aws_db_subnet_group" "db-subnet" {
#   #provider = aws.pdwebsite  
#   name       = var.dbsubnet
#   subnet_ids = [var.private_subnet_a, var.private_subnet_b, var.private_subnet_c]
# }

# resource "aws_rds_cluster_parameter_group" "blue-green" {
#   name        = "blue-green-deploy"
#   family      = "aurora-mysql8.0"
#   description = "RDS blue-green cluster parameter group"
    
#   parameter {
#     name  = "binlog_format"
#     value = "ROW"
#     apply_method = "pending-reboot"
#   }


# }

# resource "aws_rds_cluster_parameter_group" "blue-green2" {
#   name        = "blue-green-deploy-2"
#   family      = "aurora-mysql8.0"
#   description = "RDS blue-green cluster parameter group 2"
    
#   parameter {
#     name  = "binlog_format"
#     value = "ROW"
#     apply_method = "pending-reboot"
#   }


# }


