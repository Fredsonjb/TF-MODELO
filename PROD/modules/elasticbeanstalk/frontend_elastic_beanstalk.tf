
# data "aws_elastic_beanstalk_hosted_zone" "current" {}


# resource "aws_elastic_beanstalk_application" "elasticapp" {
#   name = var.application_name
# }

# data "aws_elastic_beanstalk_solution_stack" "php_latest" {
#   most_recent = true

#   name_regex = "^64bit Amazon Linux (.*) running PHP 8.1$"
# }


# resource "aws_elastic_beanstalk_environment" "beanstalkappenv" {
#   name                = "Frontend-${var.app_tags}"
#   application         = var.application_name
#   solution_stack_name = data.aws_elastic_beanstalk_solution_stack.php_latest.name
#   tier                = "WebServer"
#   tags = {
#     APP_NAME = var.app_tags
#   }

#   setting {
#     namespace = "aws:ec2:vpc"
#     name      = "VPCId"
#     value     = module.vpc.vpc_id
#   }
#   setting {
#     namespace = "aws:autoscaling:launchconfiguration"
#     name      = "IamInstanceProfile"
#     value     = "aws-elasticbeanstalk-ec2-role"
#   }
#   setting {
#     namespace = "aws:elasticbeanstalk:environment"
#     name      = "ServiceRole"
#     value     = "aws-elasticbeanstalk-service-role"
#   }
#   setting {
#     namespace = "aws:ec2:vpc"
#     name      = "AssociatePublicIpAddress"
#     value     = "True"
#   }

#   setting {
#     namespace = "aws:autoscaling:launchconfiguration"
#     name      = "DisableIMDSv1"
#     value     = "true"
#   }

#   setting {
#     namespace = "aws:ec2:vpc"
#     name      = "Subnets"
#     value     = join(",", var.ec2_subnets)
#   }

#   setting {
#     namespace = "aws:ec2:vpc"
#     name      = "ELBSubnets"
#     value     = join(",", var.elb_subnets)
#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:environment:process:default"
#     name      = "MatcherHTTPCode"
#     value     = "200"
#   }
#   setting {
#     namespace = "aws:elasticbeanstalk:environment"
#     name      = "LoadBalancerType"
#     value     = "application"
#   }
#   setting {
#     namespace = "aws:autoscaling:launchconfiguration"
#     name      = "InstanceType"
#     value     = var.instance_type
#   }
#   setting {
#     namespace = "aws:autoscaling:launchconfiguration"
#     name      = "RootVolumeType"
#     value     = "gp3"
#   }

#   setting {
#     namespace = "aws:autoscaling:launchconfiguration"
#     name      = "RootVolumeSize"
#     value     = var.disk_size
#   }

#   setting {
#     namespace = "aws:autoscaling:launchconfiguration"
#     name      = "RootVolumeIOPS"
#     value     = 3000
#   }

#   setting {
#     namespace = "aws:autoscaling:launchconfiguration"
#     name      = "RootVolumeThroughput"
#     value     = 125
#   }

#   setting {
#     namespace = "aws:autoscaling:launchconfiguration"
#     name      = "SSHSourceRestriction"
#     value     = "tcp, 22, 22, ${var.sshrestrict}"
#   }

#   setting {
#     namespace = "aws:ec2:vpc"
#     name      = "ELBScheme"
#     value     = "internet facing"
#   }
#   setting {
#     namespace = "aws:autoscaling:asg"
#     name      = "MinSize"
#     value     = 2
#   }
#   setting {
#     namespace = "aws:autoscaling:asg"
#     name      = "MaxSize"
#     value     = 4
#   }
#   setting {
#     namespace = "aws:elasticbeanstalk:healthreporting:system"
#     name      = "SystemType"
#     value     = "enhanced"
#   }

#   setting {
#     namespace = "aws:autoscaling:updatepolicy:rollingupdate"
#     name      = "RollingUpdateEnabled"
#     value     = true

#   }

#   setting {
#     namespace = "aws:autoscaling:updatepolicy:rollingupdate"
#     name      = "RollingUpdateType"
#     value     = "Health"

#   }

#   setting {
#     namespace = "aws:autoscaling:updatepolicy:rollingupdate"
#     name      = "MinInstancesInService"
#     value     = 2

#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:command"
#     name      = "DeploymentPolicy"
#     value     = "RollingWithAdditionalBatch"

#   }

#   setting {
#     namespace = "aws:autoscaling:updatepolicy:rollingupdate"
#     name      = "MaxBatchSize"
#     value     = 1

#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:command"
#     name      = "BatchSizeType"
#     value     = "Percentage"

#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:command"
#     name      = "BatchSize"
#     value     = 100

#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:command"
#     name      = "IgnoreHealthCheck"
#     value     = true

#   }

#   ###=========================== Logging ========================== ###

#   setting {
#     namespace = "aws:elasticbeanstalk:hostmanager"
#     name      = "LogPublicationControl"
#     value     = false

#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:cloudwatch:logs"
#     name      = "StreamLogs"
#     value     = true

#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:cloudwatch:logs"
#     name      = "DeleteOnTerminate"
#     value     = true

#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:cloudwatch:logs"
#     name      = "RetentionInDays"
#     value     = 7

#   }

#   setting {
#     namespace = "aws:autoscaling:launchconfiguration"
#     name      = "EC2KeyName"
#     value     = var.keypair

#   }
#   ############## Connect rds to elastic beanstalk #################################

#   setting {
#     namespace = "aws:elasticbeanstalk:application:environment"
#     name      = "RDS_HOSTNAME"
#     value     = "dbwordpress-frontend-0.cykeandezale.eu-central-1.rds.amazonaws.com"
#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:application:environment"
#     name      = "RDS_PORT"
#     value     = "3306"
#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:application:environment"
#     name      = "RDS_DB_NAME"
#     value     = var.dbname-qual
#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:application:environment"
#     name      = "RDS_USERNAME"
#     value     = var.db_super_user
#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:application:environment"
#     name      = "RDS_PASSWORD"
#     value     = var.db_password
#   }


#   ###=========================== Load Balancer ========================== ###
#   setting {
#     namespace = "aws:elbv2:listener:default"
#     name      = "ListenerEnabled"
#     value     = false
#   }

#   setting {
#     namespace = "aws:elbv2:listener:443"
#     name      = "ListenerEnabled"
#     value     = true
#   }
#   setting {
#     namespace = "aws:elbv2:listener:443"
#     name      = "Protocol"
#     value     = "HTTPS"
#   }
#   setting {
#     namespace = "aws:elbv2:listener:443"
#     name      = "SSLCertificateArns"
#     value     = "arn:aws:acm:eu-central-1:878024869515:certificate/8c81ffe8-2b45-4646-83ce-3a8a47db00a2"
#   }
#   setting {
#     namespace = "aws:elbv2:listener:443"
#     name      = "SSLPolicy"
#     value     = "ELBSecurityPolicy-2016-08"

#   }
#   setting {
#     namespace = "aws:elasticbeanstalk:environment:process:default"
#     name      = "HealthCheckPath"
#     value     = "/"
#   }
#   setting {
#     namespace = "aws:elasticbeanstalk:environment:process:default"
#     name      = "Port"
#     value     = 80
#   }
#   setting {
#     namespace = "aws:elasticbeanstalk:environment:process:default"
#     name      = "Protocol"
#     value     = "HTTP"
#   }

#   ###=========================== Autoscale trigger ========================== ###

#   setting {
#     namespace = "aws:autoscaling:trigger"
#     name      = "MeasureName"
#     value     = "CPUUtilization"

#   }

#   setting {
#     namespace = "aws:autoscaling:trigger"
#     name      = "Statistic"
#     value     = "Average"

#   }

#   setting {
#     namespace = "aws:autoscaling:trigger"
#     name      = "Unit"
#     value     = "Percent"

#   }

#   setting {
#     namespace = "aws:autoscaling:trigger"
#     name      = "LowerThreshold"
#     value     = 20

#   }

#   setting {
#     namespace = "aws:autoscaling:trigger"
#     name      = "LowerBreachScaleIncrement"
#     value     = -1

#   }

#   setting {
#     namespace = "aws:autoscaling:trigger"
#     name      = "UpperThreshold"
#     value     = 80

#   }

#   setting {
#     namespace = "aws:autoscaling:trigger"
#     name      = "UpperBreachScaleIncrement"
#     value     = 1

#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:managedactions"
#     name      = "ManagedActionsEnabled"
#     value     = "true"
#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:managedactions"
#     name      = "PreferredStartTime"
#     value     = "Tue:10:00"
#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
#     name      = "UpdateLevel"
#     value     = "minor"
#   }

#   setting {
#     namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
#     name      = "InstanceRefreshEnabled"
#     value     = "true"
#   }


# }


# resource "aws_lb_listener" "https_redirect" {
#   load_balancer_arn = aws_elastic_beanstalk_environment.beanstalkappenv.load_balancers[0]
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type = "redirect"

#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }

# }


# data "aws_lb" "eb_lb" {
#   arn = aws_elastic_beanstalk_environment.beanstalkappenv.load_balancers[0]
# }

# resource "aws_security_group_rule" "allow_80" {
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = tolist(data.aws_lb.eb_lb.security_groups)[0]
# }
# resource "aws_security_group_rule" "allow_443" {
#   type              = "egress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = tolist(data.aws_lb.eb_lb.security_groups)[0]
# }

