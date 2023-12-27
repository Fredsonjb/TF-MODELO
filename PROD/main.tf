module "vpc" {
  source       = "./modules/vpc"
  avz-A        = var.az-A
  avz-B        = var.az-B
  avz-C        = var.az-C
  region       = var.region
  env          = var.env
  project_name = var.project_name
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

# }

# module "security_groups" {
#   source = "./security_groups"
#   vpc_id = module.vpc.vpc_id
# }