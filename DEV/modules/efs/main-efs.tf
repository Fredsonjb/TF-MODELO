# ########## CREATE EFS FILE SYSTEM #################

# resource "aws_efs_file_system" "efs" {
#   creation_token = "efs-${var.project_name}-${var.env}"
#   lifecycle_policy {
#     transition_to_ia = "AFTER_30_DAYS"
#   }
#   encrypted = true
#   tags = {
#     "Name" = var.project_name
#     "Environment" = var.env
#   }
# }
# ########### BACKUP POLICY ###########################

# resource "aws_efs_backup_policy" "policy" {
#   file_system_id = aws_efs_file_system.efs.id

#   backup_policy {
#     status = "ENABLED"
#   }
# }
# ############ MOUT-TARGET #############################

# resource "aws_efs_mount_target" "mount_network" {
#   file_system_id  = aws_efs_file_system.efs.id
#   subnet_id       = var.private_subnet_b
#   security_groups = [var.sg_permit_network_connection]
# }


