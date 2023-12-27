module "cloudfront" {
  source       = "./modules/cloudfront"
  env          = var.env
  project_name = var.project_name
  domain_name  = var.domain_name
}

module "cloudwatch" {
  source          = "./modules/cloudwatch"
  env             = var.env
  project_name    = var.project_name
  domain_name     = var.domain_name
  alarm_sns_topic = var.alarm_sns_topic
}
# module "data_base_aurora" {
#   source           = "./modules/data_base_aurora"
#   avz-A            = var.az-A
#   avz-B            = var.az-B
#   avz-C            = var.az-C
#   region           = var.region
#   db_super_user    = var.db_super_user
#   db_password      = var.db_password
#   private_subnet_a = module.vpc.private_subnet_a
#   private_subnet_b = module.vpc.private_subnet_b
#   private_subnet_c = module.vpc.private_subnet_c
#   vpc_id           = module.vpc.vpc_id
#   sg               = module.security_groups.sg_permit_network_connection
#   env          = var.env
#   project_name = var.project_name
# }
module "dynamodb" {
  source       = "./modules/dynamodb"
  env          = var.env
  project_name = var.project_name

}

# module "ec2" {
#   source            = "./modules/ec2"
#   ami               = var.ami
#   ec2_instance_type = var.ec2_instance_type
#   key_name          = var.key_name
#   volume_size       = var.volume_size
#   volume_type       = var.volume_type
#   private_subnet_a  = module.vpc.private_subnet_a
#   private_subnet_b  = module.vpc.private_subnet_b
#   sg                = module.security_groups.sg_permit_network_connection
#   avz-A             = var.az-A
#   avz-B             = var.az-B
#   env               = var.env
#   project_name      = var.project_name

# }

# module "efs" {
#   source       = "./modules/efs"
#   env          = var.env
#   project_name = var.project_name
#   private_subnet_b = module.vpc.private_subnet_b
#   sg_permit_network_connection = module.security_groups.sg_permit_network_connection
# }

module "elasticache" {
  source                           = "./modules/elasticache"
  env                              = var.env
  project_name                     = var.project_name
  elasticache_subnet_name          = var.elasticache_subnet_name
  elasticache_cluster_id           = var.elasticache_cluster_id
  elasticache_engine               = var.elasticache_engine
  elasticache_node_type            = var.elasticache_node_type
  elasticache_parameter_group_name = var.elasticache_parameter_group_name
  elasticache_port                 = var.elasticache_port
  elasticache_num_nodes            = var.elasticache_num_nodes
}
# module "vpc" {
#   source       = "./modules/vpc"
#   avz-A        = var.az-A
#   avz-B        = var.az-B
#   avz-C        = var.az-C
#   region       = var.region
#   env          = var.env
#   project_name = var.project_name
# }



# module "security_groups" {
#   source       = "./modules/security_groups"
#   vpc_id       = module.vpc.vpc_id
#   env          = var.env
#   project_name = var.project_name

# }