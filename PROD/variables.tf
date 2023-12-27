variable "region" {
  default = "eu-central-1"
}

#-------------------
#### VAR TAGS ####
variable "env" {
  default = "Prod"
}
variable "project_name" {
  default = "Devoteam"
}
#-------------------

variable "vpc_id" {
  default = "id of vpc"
}
variable "ec2_subnets" {
  type    = list(any)
  default = ["subnet-042098ca74b5201bf", "subnet-049d6888c848efade"]
}
variable "elb_subnets" {
  type    = list(any)
  default = ["subnet-042098ca74b5201bf", "subnet-049d6888c848efade"]
}
variable "instance_type" {
  default = "t3.large"
}
variable "disk_size" {
  default = "50"
}
variable "keypair" {
  default = "server-access-key"
}
variable "sshrestrict" {
  default = "0.0.0.0/0"
}
variable "alarm_sns_topic" {
  default = "arn:aws:sns:eu-central-1:878024869515:frontend"
}
#-----------------------------------------------------------
#### VARS DATA BASE ####
variable "db_super_user" {}
variable "db_password" {}

#----------------------------------------------------------
#### Variables ElasticBeansTalk BackEnd APP ####
variable "elasticapp_green" {
  default = "green-app-EB"
}
variable "beanstalkappenv_green" {
  default = "green-app-EB"
}
variable "solution_stack_name" {
  default = "64bit Amazon Linux 2 v3.5.4 running PHP 8.1"
}
variable "tier" {
  default = "WebServer"
}

#--------------------------------------------------------
#### Variables ElasticBeansTalk FrontEnd APP ####
variable "app_name" {
  default = "App-Frontend"
}
variable "application_name" {
  default = "App-Frontend"
}
#--------------------------------------------------------------------
#### VARS SUBNETS #####
variable "public_subnets" {
  default = ["subnet-06d0bc49ad24d3eec", "subnet-027d7c59e776afbce"]
}
variable "elb_public_subnets" {
  default = ["subnet-06d0bc49ad24d3eec", "subnet-027d7c59e776afbce"]
}
variable "private_subnets" {
  default = ["subnet-08b9a908a32c12a73", "subnet-0676aa9489b5c1401"]
}
#--------------------------------------------------------------------

#### - Variables Elasticache - ####

variable "elasticache_subnet_name" {
  default = "tf-elastic-cache-subnet"
}
variable "elasticache_cluster_id" {
  default = "cluster-eb-frontend"
}
variable "elasticache_engine" {
  default = "memcached"
}
variable "elasticache_node_type" {
  default = "cache.t3.medium"
}
variable "elasticache_parameter_group_name" {
  default = "default.memcached1.6"
}
variable "elasticache_port" {
  default = "11211"
}
variable "elasticache_num_nodes" {
  default = "1"
}

#----------------------------
####-Availability_Zones-####

variable "az-A" {
  type    = string
  default = "eu-central-1a"
}
variable "az-B" {
  type    = string
  default = "eu-central-1b"
}
variable "az-C" {
  type    = string
  default = "eu-central-1c"
}

variable "sgconnectionnetwork" {
  type    = string
  default = "sg-02d696644b87df55c"
}
variable "domain_name" {
  default = "awscoeelasticbeanstalkteste.com"
}