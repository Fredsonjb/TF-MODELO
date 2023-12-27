
# #creating Cloudfront distribution :
# resource "aws_cloudfront_distribution" "cf_dist" {
#   enabled = true
#   #aliases = [var.domain_name]
#   origin {
#     domain_name = "awseb-AWSEB-1DS0QNDIC5VBY-1789377667.eu-central-1.elb.amazonaws.com"
#     origin_id   = "awseb-AWSEB-1DS0QNDIC5VBY"

#     custom_origin_config {
#       http_port              = 80
#       https_port             = 443
#       origin_protocol_policy = "https-only"
#       origin_ssl_protocols   = ["TLSv1.2"]
#     }
#   }

#   ####################**** BEHAVIORS ****##################################################
#   #### **** Default **** ####
#   default_cache_behavior {
#     allowed_methods          = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
#     cached_methods           = ["GET", "HEAD"]
#     cache_policy_id          = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
#     #origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3"
#     target_origin_id         = "awseb-AWSEB-1DS0QNDIC5VBY"
#     viewer_protocol_policy   = "redirect-to-https"
#   }  
#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#       #locations        = ["IN", "US", "CA", "PT"]
#       }
#     }

#   viewer_certificate {
#     cloudfront_default_certificate = true
#     # acm_certificate_arn      = "arn:aws:acm:us-east-1:878024869515:certificate/f43fb7ac-e82e-4e92-8f5b-a89430a11bbb"
#     # ssl_support_method       = "sni-only"
#     # minimum_protocol_version = "TLSv1.2_2018"
#   }
# }

