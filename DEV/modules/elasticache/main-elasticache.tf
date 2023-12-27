
# resource "aws_elasticache_subnet_group" "sub-a" {
#   name       = var.elasticache_subnet_name
#   subnet_ids = [module.vpc.private_subnet_a, module.vpc.private_subnet_b]
# }

# resource "aws_elasticache_cluster" "elasticache" {
#   cluster_id           = var.elasticache_cluster_id
#   engine               = var.elasticache_engine
#   node_type            = var.elasticache_node_type
#   num_cache_nodes      = var.elasticache_num_nodes
#   parameter_group_name = var.elasticache_parameter_group_name
#   port                 = var.elasticache_port
#   security_group_ids   = [module.security_groups.sg_permit_network_connection]
#   subnet_group_name    = aws_elasticache_subnet_group.sub-a.name
#   tags = {
#     "Name"    = "Elasticache - Qual"
#     "Env"     = "Qual"
#     "Company" = "JM"
#   }


# }
