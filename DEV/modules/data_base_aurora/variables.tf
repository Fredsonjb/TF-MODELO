
variable "avz-A" {}
variable "avz-B" {}
variable "avz-C" {}
variable "region" {}
variable "private_subnet_a" {}
variable "private_subnet_b" {}
variable "private_subnet_c" {}
variable "vpc_id" {}
variable "sg" {}
variable "env" {}
variable "project_name" {}


##############-RESOURCES DATABASE-##########################

###-Variable DB Name-###
variable "dbname" {
  default = "db-frontend"
}

###-Variable DB User-###
variable "db_super_user" {}

###-Variable DB Password-###
variable "db_password" {}

variable "db_storage_type" {
  type    = string
  default = "gp2"
}

variable "db_engine" {
  type    = string
  default = "aurora-mysql"
}

variable "db_version" {
  type    = string
  default = "8.0.mysql_aurora.3.05.0"
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.medium"
}

variable "dbsubnet" {
  default = "dbsubnet"
}
############################################################