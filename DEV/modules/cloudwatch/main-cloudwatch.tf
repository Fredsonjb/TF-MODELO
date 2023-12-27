
# resource "aws_sns_topic" "user_updates" {
#   name = "sns-${var.project_name}-${var.env}"

# }

# resource "aws_cloudwatch_metric_alarm" "EB_API_ENV_HEALTH_SEVERE" {
#   alarm_name          = "Alarm-${var.project_name}-${var.env}-EB_API_ENV_HEALTH_SEVERE"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "EnvironmentHealth"
#   namespace           = "AWS/ElasticBeanstalk"
#   period              = "300"
#   statistic           = "Average"
#   threshold           = "25"
#   alarm_description   = "Environment health is severe"
#   alarm_actions       = [var.alarm_sns_topic]
#   dimensions = {
#     EnvironmentName = "FrontEnd-QUAL"
#   }

# }

# resource "aws_cloudwatch_metric_alarm" "EB_API_ENV_HEALTH_WARNING" {
#   alarm_name          = "Alarm-${var.project_name}-${var.env}-EB_API_ENV_HEALTH_WARNIN"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "EnvironmentHealth"
#   namespace           = "AWS/ElasticBeanstalk"
#   period              = "900"
#   statistic           = "Average"
#   threshold           = "15"
#   alarm_description   = "Alarm-${var.project_name}-${var.env}-health is warning"
#   alarm_actions       = [var.alarm_sns_topic]
#   dimensions = {
#     EnvironmentName = var.env
#   }

# }

# resource "aws_cloudwatch_metric_alarm" "LB5xxError" {
#   alarm_name          = "Alarm-${var.project_name}-${var.env}-LB5xxError"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "HTTPCode_Target_5XX_Count"
#   namespace           = "AWS/ApplicationELB"
#   period              = "300"
#   statistic           = "Average"
#   threshold           = "30"
#   alarm_description   = "Alarm-${var.project_name}-${var.env}-LoadBalancer - 5XX - Error"
#   alarm_actions       = [var.alarm_sns_topic]
#   dimensions = {
#     LoadBalancer = "arn:aws:elasticloadbalancing:eu-central-1:878024869515:loadbalancer/app/awseb-AWSEB-LN83MQNOQ91V/b434fbf7efa6d3a4"
#   }

# }

# resource "aws_cloudwatch_metric_alarm" "ApiNetworkOut" {
#   alarm_name          = "Alarm-${var.project_name}-${var.env}-ApiNetworkOut"
#   comparison_operator = "GreaterThanOrEqualToThreshold"
#   evaluation_periods  = "1"
#   metric_name         = "NetworkOut"
#   namespace           = "AWS/EC2"
#   period              = "300"
#   statistic           = "Average"
#   threshold           = "300000000"
#   alarm_description   = "Alarm-${var.project_name}-${var.env}-Network Out"
#   alarm_actions       = [var.alarm_sns_topic]
#   dimensions = {
#     AutoScalingGroupName = "awseb-e-ei7mfxhfeu-stack-AWSEBAutoScalingGroup-16VDD4TS66AW3"
#   }

# }
